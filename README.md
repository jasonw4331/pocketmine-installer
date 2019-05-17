# PocketMine Installer [![GitHub Releases (by Asset)](https://img.shields.io/github/downloads/nathfreder/pocketmine-installer/latest/PocketMine-MP.exe.svg)](https://github.com/nathfreder/pocketmine-installer/releases)

## Download Installer
You can download the latest release from [GitHub Releases](https://github.com/nathfreder/pocketmine-installer/releases).

## Demo
![Imgur](https://i.imgur.com/ZLLdHcc.gif)

## Development
#### Prerequisites
* [NSIS](https://nsis.sourceforge.io/Main_Page)
* [Inetc Plug-in](https://nsis.sourceforge.io/Inetc_plug-in)
* [ZipDLL Plug-in](https://nsis.sourceforge.io/ZipDLL_plug-in)

#### Compiling
```sh
makensis /DPHP_BUILD_NUMBER=64 "PocketMine-MP.nsi"
```
