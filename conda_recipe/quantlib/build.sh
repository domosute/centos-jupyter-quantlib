#!/bin/bash
./autogen.sh
./configure
make -j 4
make install
