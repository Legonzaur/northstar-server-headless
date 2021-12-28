cd Titanfall2
export WINEARCH=win64
export WINEPREFIX=/Wine
export LIBGL_ALWAYS_SOFTWARE=1
export __GLX_VENDOR_LIBRARY_NAME=mesa
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/lvp_icd.x86_64.json
export WINEDEBUG=-all

winetricks dxvk || true

if [ ! -f "NorthstarLauncher.exe" ]; then
    wget https://github.com/R2Northstar/Northstar/releases/download/v1.1.3/Northstar.release.v1.1.3.zip
    unzip Northstar.release.v1.1.3.zip
fi                                                           
                                                             
xvfb-run bash -c "wine NorthstarLauncher.exe -dedicated -multiple | cat"
