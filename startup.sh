#!/bin/bash
cd Titanfall2
export WINEARCH=win64
export WINEPREFIX=/Wine
export LIBGL_ALWAYS_SOFTWARE=1
export __GLX_VENDOR_LIBRARY_NAME=mesa
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/lvp_icd.x86_64.json
export WINEDEBUG=-all

xvfb-run bash -c "wine64 NorthstarLauncher.exe -dedicated -multiple | cat"