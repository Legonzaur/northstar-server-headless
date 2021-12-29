#!/bin/bash
cd Titanfall2
export WINEARCH=win64
export WINEPREFIX=/Wine
export LIBGL_ALWAYS_SOFTWARE=1
export __GLX_VENDOR_LIBRARY_NAME=mesa
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/lvp_icd.x86_64.json
export WINEDEBUG=fixme+all


wineboot -i -e && wineserver --wait
#/dxvk-master/setup_dxvk.sh install
winetricks dxvk || true
#cp /dxvk/d3d11.dll /Titanfall2/
cp /dxvk-master/x64/d3d11.dll /Wine/dosdevices/c:/windows/system32/
if [ ! -f "NorthstarLauncher.exe" ]; then
    curl -s https://api.github.com/repos/R2Northstar/Northstar/releases/latest | grep browser_download_url | cut -d '"' -f 4 | xargs wget -O northstar.zip
    unzip northstar.zip
fi                                                           
                                                             
xvfb-run bash -c "wine NorthstarLauncher.exe -dedicated -multiple | cat"
