make -C %ZGB_PATH%\src clean BUILD_TYPE=Release
make -C %ZGB_PATH%\src clean BUILD_TYPE=Debug
make -C %ZGB_PATH%\src clean BUILD_TYPE=ReleaseColor
make -C %ZGB_PATH%\src clean BUILD_TYPE=DebugColor
cd src
make clean BUILD_TYPE=Release
make clean BUILD_TYPE=Debug
make clean BUILD_TYPE=ReleaseColor
make clean BUILD_TYPE=DebugColor
cd ..
pause