#!/bin/bash
./autogen.sh
./configure --prefix=/opt/conda
make
make install
