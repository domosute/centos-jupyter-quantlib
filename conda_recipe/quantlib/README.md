Reference:
----------

http://www.quantlib.org/install/linux.shtml

Pre-requisite:
--------------

 Make sure to have boost installed on build environment.

 - Debian: `apt-get install -y libboost-all-dev`

 - CentOS: 'yum install -y boost-devel`

To build: 
---------
within the folder, run `"conda-build ."`

To upload:
----------
1. `anaconda login`
2. `anaconda upload <location of conda>/conda-bld/<target architecture>/<created .tar.bz file>`
