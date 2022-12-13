#strip is used to strip debug symbol of lib.
#export STRIP="android-ndk-r21d/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64/arm-linux-androideabi/bin/"
NDK="android-ndk-r21d"
TOOLCHAIN="cmake/android.toolchain.cmake"
GENERATOR="Ninja"

function build(){
    ABI=$1
    BUILD_PATH=build.android.${ABI}
	OUT_PATH="./Plugins/Android/libs/${ABI}"
    cmake -S . -B ${BUILD_PATH} -DCMAKE_TOOLCHAIN_FILE=${TOOLCHAIN} -DANDROID_NDK=${NDK} -DANDROID_ABI=${ABI} -DCMAKE_GENERATOR=${GENERATOR}
    cmake --build ${BUILD_PATH} --config Release
    mkdir -p Plugins/Android/libs/${ABI}/
    cp ${BUILD_PATH}/libsecp256k1.so ${OUT_PATH}/libsecp256k1.so
}

build armeabi-v7a
build arm64-v8a