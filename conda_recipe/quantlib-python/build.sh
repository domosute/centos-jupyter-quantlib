#!/bin/bash

./autogen.sh
./configure --prefix=$PREFIX
make -C Python
make check
make install
cd Python
python setup.py wrap
python setup.py build
python setup.py install
