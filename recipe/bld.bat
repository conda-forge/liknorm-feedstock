mkdir build && cd build

cmake -GNinja ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
    -DBUILD_SHARED_LIBS=ON ^
    "%SRC_DIR%"

cmake --build . --config Release
ctest --output-on-failure -C Release
cmake --build . --config Release --target install
