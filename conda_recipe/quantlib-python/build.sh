#!/bin/bash

PREFIX= # Set prefix here
INCLUDE_PATH=$PREFIX/include
LIBRARY_PATH=$PREFIX/lib

./autogen.sh
./configure --prefix=$PREFIX --boost-include-dir=$INCLUDE_PATH --boost-lib-dir=$LIBRARY_PATH
make -j 4 -C Python
sudo make -C Python install
