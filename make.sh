#!/bin/sh
make BUILD_MISSIONPACK=0 -j8 || exit 1

cd build/release-linux-`uname -m`/baseq3
zip -r ../../../pak7-android.pk3 vm
cd ../../../android
zip -r ../pak7-android.pk3 *
cd ..
for dest in ../engine/build/*-linux-`uname -m`/baseoa; do
cp -f pak7-android.pk3 $dest
done
rm -f pak7-android.pk3

#env NO_SHARED_LIBS=1 BUILD_EXECUTABLE=1 V=1 ../../setEnvironment-armeabi.sh make -j8 PLATFORM=android ARCH=armeabi USE_LOCAL_HEADERS=0 BUILD_MISSIONPACK=0 && \
#env NO_SHARED_LIBS=1 BUILD_EXECUTABLE=1 V=1 ../../setEnvironment-armeabi-v7a.sh make -j8 PLATFORM=android ARCH=armeabi-v7a USE_LOCAL_HEADERS=0 BUILD_MISSIONPACK=0

