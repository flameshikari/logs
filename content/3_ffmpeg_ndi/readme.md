---
title: FFmpeg with NDI
description: Building fresh FFmpeg with NDI support
date: 2024.06.09 12:12:12 UTC+5
categories:
  - windows
  - ffmpeg
  - ndi
---

![](./assets/_header.png)



Download [NDI SDK 6](https://downloads.ndi.tv/SDK/NDI_SDK/NDI%206%20SDK.exe) and install

Clone [Media Autobuild Suite](https://github.com/m-ab-s/media-autobuild_suite) somewhere in the root of the disk (to prevent long path errors). cd into the cloned repo and apply patch:

curl -sL https://github.com/flameshikari/logs/content | git apply -v --index

Create the script:




also keep in mind that the resulted binary is not for redistribution

dependencies:

- [a](https://github.com/m-ab-s/media-autobuild_suite)

- [a](https://github.com/moocowsheep/ffmpeg-ndi-patch)

- [a](https://ndi.video/for-developers/ndi-sdk/download)




This example is for Windows only. If you're experienced with building from the source, you can easily adapt it for other systems. H

- [Windows](https://downloads.ndi.tv/SDK/NDI_SDK/NDI%206%20SDK.exe)

- [Linux](https://downloads.ndi.tv/SDK/NDI_SDK_Linux/Install_NDI_SDK_v6_Linux.tar.gz)
  
- [macOS / iOS](https://downloads.ndi.tv/SDK/NDI_SDK_Mac/Install_NDI_SDK_v6_Apple.pkg)

- [Android for Linux](https://downloads.ndi.tv/SDK/NDI_SDK_Android/Install_NDI_SDK_v6_Android.tar.gz)

- [Android for Windows](https://downloads.ndi.tv/SDK/NDI_SDK_Android/NDI%206%20SDK%20%28Android%29.exe)

Copy:
- sdk/include/* to local64/include
- sdk/bin/Processing.NDI.Lib.x64.lib to local64/lib/libndi.dll.a

References:

- Issues [#903](https://github.com/m-ab-s/media-autobuild_suite/issues/903), [#1145](https://github.com/m-ab-s/media-autobuild_suite/issues/1145), [#2209](https://github.com/m-ab-s/media-autobuild_suite/issues/2209)

- [FFmpeg NDI Patch](https://github.com/moocowsheep/ffmpeg-ndi-patch?tab=readme-ov-file#usage-)
