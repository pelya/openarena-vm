#!/bin/sh
SDLDIR=../SDL-android
SDLCONFIG=$SDLDIR/project/jni/application/setEnvironment.sh

env NO_SHARED_LIBS=1 BUILD_EXECUTABLE=1 V=1 $SDLCONFIG make -j8 PLATFORM=android ARCH=arm USE_LOCAL_HEADERS=0 2>&1 | tee build.log
