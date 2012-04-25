#!/bin/bash -e

BUILD_DIR=${HOME}/openbox
CURRENT_DIR=`pwd`

# clean up extraneous build artifacts from previous runs
rm -f *.tgz

# create directory to build all artifacts
mkdir -p ${BUILD_DIR}/usr

# build openbox
./bootstrap
./configure --prefix=${BUILD_DIR}/usr
make clean
make install

# package all installed artifacts
pushd ${BUILD_DIR}
   tar zcvf ${CURRENT_DIR}/openbox-em.tgz usr
popd

# clean up build dir
rm -fR ${BUILD_DIR}
