#!/usr/bin/env -S pwsh.exe -noni -nop -nol -ex bypass

$KpDatabase = "abs_windows_path_to_Database.kdbx"
$KpExecPath = "abs_windows_path_to_KeePassXC.exe"
$KpExecName = (Get-ChildItem $KpExecPath).Basename

$AgentExecPath = "$PSScriptRoot\omni-ssh-agent.exe"
$AgentExecName = (Get-ChildItem $AgentExecPath).Basename

Function Run-Agent {
  ssh-add -l 2>&1 | Out-Null # somehow it's faster than running it via Start-Process
  $ExitCode = $LastExitCode
  If ($ExitCode -eq 2) { # start the agent if it's not running
    $IsProcessRunning = Get-Process -ErrorAction SilentlyContinue $AgentExecName | Select -Expand ProcessName
    If (-Not $IsProcessRunning) {
      Start-Process -PassThru -WindowStyle Hidden $AgentExecPath 2>&1 | Out-Null
      Start-Sleep 1
    }
  }
  Return $ExitCode
}

Function Run-KeePass {
  $IsProcessRunning = (Get-Process -ErrorAction SilentlyContinue $KpExecName | Select -Expand ProcessName) ? $True : $False
  If (-Not $IsProcessRunning) {
    Start-Process -PassThru -WindowStyle Maximized $KpExecPath -ArgumentList $KpDatabase  2>&1 | Out-Null
    Start-Sleep 1
  }
  $IsWindowHidden = ((New-Object -ComObject WScript.Shell).AppActivate((Get-Process $KpExecName -ErrorAction SilentlyContinue).MainWindowTitle)) ? $False : $True
  If ($IsWindowHidden) {
    Start-Process $KpExecPath -PassThru 2>&1 | Out-Null
    Start-Sleep 1
  }
}

While ((Run-Agent) -ne 0) {
  Run-KeePass
  Start-Sleep -Seconds 3
}