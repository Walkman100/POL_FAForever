# FAForever PlayOnLinux Script
PlayOnLinux script to get the FAForever lobby running that also installs requirements of the actual game (Forged Alliance), so after installing this you should be able to run FA in the wineprefix generated.

The official `Microsoft Visual C++ 2010 Redistributable Package (x86)` (vcredist_x86.exe) is installed instead of the PlayOnLinux function (`POL_Install_msvc100`), because if you have the PlayOnLinux version installed the lobby tells you that it isn't installed, then closes:

![not installed](https://i.imgur.com/bvFdQ1j.png)

Direct3D 9 (`POL_Install_d3dx9`) is needed by SC:FA

DirectX 9 (`POL_Install_directx9`) is needed for in-game sound, see [#1](https://github.com/Walkman100/POL_FAForever/issues/1)
