#!/usr/bin/env bash
cd $HOME/.ssh
chmod 600 authorized_keys config known_hosts* aliases/*
chmod 700 wrapper.ps1 omni-ssh-agent.exe wsl2-ssh-agent
