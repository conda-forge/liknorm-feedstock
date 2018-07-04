set LIB=%LIBRARY_LIB%;.\lib;%LIB%
set LIBPATH=%LIBRARY_LIB%;.\lib;%LIBPATH%
set INCLUDE=%LIBRARY_INC%;%INCLUDE%

set CFLAGS=%CFLAGS:MD=MT%
set CXXFLAGS=%CXXFLAGS:MD=MT%

pushd . && mkdir build && cd build
if errorlevel 1 exit 1

cmake -G "%CMAKE_GENERATOR%" ^
         -D CMAKE_BUILD_TYPE=Release ^
         -D CMAKE_INSTALL_PREFIX:PATH=%LIBRARY_PREFIX% ^
         %SRC_DIR%
if errorlevel 1 exit 1

:: Build.
cmake --build . --config Release
if errorlevel 1 exit 1

:: Test.
ctest -C Release
if errorlevel 1 exit 1

:: Install.
cmake --build . --config Release --target install
if errorlevel 1 exit 1

popd && rd /q /s build
