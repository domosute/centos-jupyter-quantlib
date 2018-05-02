#!/bin/bash

set -x -e
PREFIX= # Set prefix here
INCLUDE_PATH=$PREFIX/include
LIBRARY_PATH=$PREFIX/lib

./autogen.sh
./configure --prefix=$PREFIX --with-boost-include=$INCLUDE_PATH --with-boost-lib=$LIBRARY_PATH
make -j 4
make install
