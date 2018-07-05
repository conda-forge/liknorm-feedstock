pushd . && mkdir build && cd build
if errorlevel 1 exit 1

cmake -G "NMake Makefiles" ^
         -D CMAKE_BUILD_TYPE=Release ^
         -D CMAKE_INSTALL_PREFIX:PATH=%LIBRARY_PREFIX% ^
         %SRC_DIR%
if errorlevel 1 exit 1

:: Build.
nmake
if errorlevel 1 exit 1

:: Test.
nmake test
if errorlevel 1 exit 1

:: Install.
nmake install
if errorlevel 1 exit 1

popd && rd /q /s build
