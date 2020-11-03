# Prebuilt libraries for the FSO SCP
This repository contains the prebuilt libraries required for the FreeSpace Open Source Code Project. Currently these libraries are included here:
 * [FFmpeg](http://ffmpeg.org/)
 * [FreeType](https://www.freetype.org/) (Win32/64 and Mac)

The libraries are compiled for the three major platforms we support (Linux, Mac OSX and Windows 32- and 64-bit). To make adding or updating libraries easier this repository automatically builds the packages and uploads them to [BinTray](https://bintray.com/scp-fs2open/FSO/build-deps). This only happens for normal pushes, not pull requests.

## Using the packages
The packages are automatically downloaded by CMake when an outdated library version is detected. The packages created by the Travis CI scripts in this repository are named after the Git commit of this repository from which the package is created.

## Guidelines for contributing
If you want to update or add a library you need to update them in a fork and submit a pull request to this repository. Once the changes have been merged you can update the version in the CMake setup (in lib/prebuilt.cmake). The updated libraries will be automatically downloaded by everone who has an outdated version.

**Even if you have push access to this repository every change has to go through a pull request to make sure it is reviewed.**
