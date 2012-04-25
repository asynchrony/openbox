#!/bin/bash -e

BUILD_DIR=${HOME}/openbox
CURRENT_DIR=`pwd`

# create directory to build all artifacts
mkdir -p ${BUILD_DIR}/usr

# build openbox
./configure --prefix=${BUILD_DIR}/usr
make clean
make install

# package all installed artifacts
pushd ${BUILD_DIR}
   tar zcvf ${CURRENT_DIR}/openbox-em.tgz usr
popd

# clean up build dir
rm -fR ${BUILD_DIR}
