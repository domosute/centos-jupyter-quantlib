#!/bin/bash

./autogen.sh
./configure --prefix=$PREFIX
make -j 4 -C Python
sudo make -C Python install
