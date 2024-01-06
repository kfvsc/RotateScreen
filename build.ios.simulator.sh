#!/bin/sh

username=`whoami`
cmake -G Xcode -D CMAKE_PREFIX_PATH=/Users/$username/Qt/6.6.1/ios -D CMAKE_BUILD_TYPE=Release -D CMAKE_TOOLCHAIN_FILE=./toolchains/ios.toolchain.cmake -D PLATFORM=SIMULATOR -B build.ios.simulator
