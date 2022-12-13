cmake -S . -B build_ios -G Xcode -DCMAKE_TOOLCHAIN_FILE=./ios.toolchain.cmake -DPLATFORM=OS64
cd build_ios
cmake --build_ios . --config Release
cd ..
