#!/usr/bin/env bash
set -e

#----------------------------------------------
# Builds and install USD
# TODO: use a zipped version of AL_USDMaya to have a more consistant run
#----------------------------------------------

echo "MayaLocation=${MAYA_LOCATION}"
echo "UsdPxrConfig=$BUILD_DIR/usd/${USD_VERSION}/pxrConfig.cmake"

mkdir /tmp/usd-build/AL_USDMaya/build

cd /tmp/usd-build/AL_USDMaya/build &&\
    cmake -Wno-dev \
          -DCMAKE_INSTALL_PREFIX=$BUILD_DIR \
          -DCMAKE_MODULE_PATH=$BUILD_DIR \
          -DCMAKE_BUILD_TYPE=RelWithDebInfo \
          -DBOOST_ROOT=$BUILD_DIR \
          -DMAYA_LOCATION=/opt/usd/maya${MAYA_MAJOR_VERSION}DevKit \
          -DMAYA_EXECUTABLE=/opt/usd/maya${MAYA_MAJOR_VERSION}DevKit/bin/mayald \
          -DGTEST_ROOT=$BUILD_DIR \
          -DUSD_CONFIG_FILE=$BUILD_DIR/usd/${USD_VERSION}/pxrConfig.cmake \
          -DCMAKE_PREFIX_PATH=$MAYA_LOCATION/lib/cmake \
          .. &&\
      make -j ${BUILD_PROCS} install
      #ctest -V
