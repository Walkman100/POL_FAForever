#!/usr/bin/env playonlinux-bash
# Date : (2016-07-09 01-08)
# Last revision : (2017-09-25 22-09)
# Wine version used : 1.9.13, 1.9.10, 1.9.15, 1.9.24, 2.8, 2.17
# Distribution used to test : Linux Mint 17.3 Rosa
# Author : Walkman
[ "$PLAYONLINUX" = "" ] && exit 0
source "$PLAYONLINUX/lib/sources"

TITLE="FAForever"
PREFIX="FAForever"

IMAGEURLS="https://raw.githubusercontent.com/Walkman100/POL_FAForever/master"
POL_GetSetupImages "$IMAGEURLS/top.png" "$IMAGEURLS/left.png" "$TITLE"
POL_SetupWindow_Init
POL_Debug_Init

POL_SetupWindow_presentation "$TITLE" "github.com/orgs/FAForever/people" "faforever.com" "Walkman" "$PREFIX"
POL_System_TmpCreate "$PREFIX"
    cd "$POL_System_TmpDir"
    POL_Download "https://download.microsoft.com/download/5/B/C/5BC5DBB3-652D-4DCE-B14A-475AB85EEF6E/vcredist_x86.exe" "b88228d5fef4b6dc019d69d4471f23ec"
    POL_Download "https://github.com/FAForever/client/releases/download/0.14.0/Forged.Alliance.Forever-0.14.0-win32.msi" "cd476afba37f53bb5f925a51f436a132"

    POL_Wine_SelectPrefix "$PREFIX"
    POL_Wine_PrefixCreate "2.17"

    cd "$POL_System_TmpDir"
    POL_SetupWindow_wait "Installing Microsoft Visual C++ 2010 Redistributable Package (x86)..." "$TITLE"
    POL_Wine "vcredist_x86.exe" /passive

    POL_SetupWindow_wait "Installing FAF lobby..." "$TITLE"
    POL_Wine msiexec /i "Forged.Alliance.Forever-0.14.0-win32.msi" /q

    POL_Call POL_Install_d3dx9 # required for game to run
    POL_Call POL_Install_directx9 # required for game audio
POL_System_TmpDelete

POL_Shortcut "FAForever.exe" "$TITLE"

POL_SetupWindow_Close
exit
