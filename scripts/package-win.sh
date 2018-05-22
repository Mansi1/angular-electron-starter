#!/bin/bash
function coloredEcho(){
    local exp=$1;
    local color=$2;
    if ! [[ $color =~ '^[0-9]$' ]] ; then
       case $(echo $color | tr '[:upper:]' '[:lower:]') in
        black) color=0 ;;
        red) color=1 ;;
        green) color=2 ;;
        yellow) color=3 ;;
        blue) color=4 ;;
        magenta) color=5 ;;
        cyan) color=6 ;;
        white|*) color=7 ;; # white or invalid color
       esac
    fi
    tput setaf $color;
    echo $exp;
    tput sgr0;
}
echo ""
coloredEcho "PACKAGING FOR WINDOWS STARTED" green
coloredEcho "-------------------------------" green
cd electron
electron-packager . --overwrite --platform=win32 --arch=ia32 --asar --icon="./dist/favicon.ico" --prune=true --out="../release-builds" --version-string.ProductName="Angular-Electron-Starter"
