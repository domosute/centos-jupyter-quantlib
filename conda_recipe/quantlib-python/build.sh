#!/bin/bash

./autogen.sh
./configure
make -C Python
make check
make install
