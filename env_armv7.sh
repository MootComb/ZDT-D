#!/bin/bash

export NDK_ROOT="/opt/android-ndk"
export ANDROID_API=24
export TARGET_TRIPLE="armv7-linux-androideabi"

# Компиляторы
export CC="armv7a-linux-androideabi${ANDROID_API}-clang"
export CXX="armv7a-linux-androideabi${ANDROID_API}-clang++"
export AR="llvm-ar"
export LD="${CC}"

# Пути к sysroot и библиотекам
export SYSROOT="$NDK_ROOT/toolchains/llvm/prebuilt/linux-x86_64/sysroot"
export LIB_DIR="$SYSROOT/usr/lib/arm-linux-androideabi/${ANDROID_API}"

# Флаги для компиляции и линковки
export CFLAGS="--sysroot=$SYSROOT -D__ANDROID_API__=$ANDROID_API"
export CXXFLAGS="--sysroot=$SYSROOT -D__ANDROID_API__=$ANDROID_API"
export LDFLAGS="-L$LIB_DIR -llog"

# Флаги для Rust
export RUSTFLAGS="-C linker=${CC} -C link-arg=-llog -C link-arg=-L${LIB_DIR} -C link-arg=--sysroot=${SYSROOT}"

# Добавить NDK в PATH
export PATH="$NDK_ROOT/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH"

echo "=== Environment for ARMv7 Android ==="
echo "TARGET_TRIPLE: $TARGET_TRIPLE"
echo "CC: $CC"
echo "LIB_DIR: $LIB_DIR"
echo "RUSTFLAGS: $RUSTFLAGS"
