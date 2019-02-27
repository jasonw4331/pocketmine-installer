!include MUI2.nsh
!include LogicLib.nsh
!include x64.nsh

BrandingText "https://pmmp.io"
InstallDir "$EXEDIR\PocketMine-MP"
Name "PocketMine-MP"
OutFile "PocketMine-MP.exe"
RequestExecutionLevel "user"
SpaceTexts "none"
ShowInstDetails nevershow

Function createshortcut
    CreateShortcut "$DESKTOP\PocketMine-MP.lnk" "$INSTDIR\start.cmd"
FunctionEnd

Function .onInit
    ${If} ${RunningX64}
    ${Else}
        MessageBox MB_OK "PocketMine-MP is no longer supported on 32-bit systems."
        Abort
    ${EndIf}
FunctionEnd

!define MUI_WELCOMEFINISHPAGE_BITMAP "welcome-finish.bmp"
!define MUI_ABORTWARNING
!define MUI_FINISHPAGE_RUN "start.cmd"
!define MUI_FINISHPAGE_RUN_TEXT "Run PocketMine-MP"
!define MUI_FINISHPAGE_SHOWREADME
!define MUI_FINISHPAGE_SHOWREADME_TEXT "Create Desktop Shortcut"
!define MUI_FINISHPAGE_SHOWREADME_FUNCTION createshortcut
!define MUI_WELCOMEPAGE_TITLE "Welcome to the PocketMine-MP Installation Wizard"
!define MUI_FINISHPAGE_TITLE "Complete PocketMine-MP Setup"
!define MUI_ICON "icon.ico"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_LANGUAGE "English"

Section "Install"
    SetOutPath $INSTDIR
    SetDetailsPrint none
    inetc::get /NOCANCEL https://jenkins.pmmp.io/job/PocketMine-MP/promotion/process/Stable/lastSuccessfulBuild/artifact/PocketMine-MP.phar PocketMine-MP.phar
    inetc::get /NOCANCEL https://raw.githubusercontent.com/pmmp/PocketMine-MP/master/start.cmd start.cmd
    inetc::get /NOCANCEL https://raw.githubusercontent.com/pmmp/PocketMine-MP/master/start.ps1 start.ps1
    inetc::get /NOCANCEL https://raw.githubusercontent.com/pmmp/PocketMine-MP/master/LICENSE LICENSE
    inetc::get /NOCANCEL https://raw.githubusercontent.com/pmmp/PocketMine-MP/master/README.md README.md
    inetc::get /NOCANCEL https://raw.githubusercontent.com/pmmp/PocketMine-MP/master/CONTRIBUTING.md CONTRIBUTING.md 
    inetc::get /NOCANCEL https://jenkins.pmmp.io/job/PHP-7.2-Aggregate/lastSuccessfulBuild/artifact/PHP-7.2-Windows-x64.zip $TEMP\PHP-7.2-Windows-x64.zip
    inetc::get /NOCANCEL https://aka.ms/vs/15/release/VC_redist.x64.exe $TEMP\VC_redist.x64.exe
    ZipDLL::extractall $TEMP\PHP-7.2-Windows-x64.zip $INSTDIR
    ExecWait '"$TEMP\VC_redist.x64.exe" /install /passive /norestart'    
SectionEnd