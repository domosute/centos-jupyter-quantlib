Reference:
----------

http://www.quantlib.org/install/linux.shtml

Pre-requisite:
--------------
 Make sure to have boost installed on build environment.

 - Debian: 

 - CentOS: `yum install perl-ExtUtils-MakeMaker -y`

To build: 
---------
Within the folder, set $PREFIX as conda installed directory, then run `"conda-build ."`

To upload:
----------
1. `anaconda login`
2. `anaconda upload <location of conda>/conda-bld/<target architecture>/<created .tar.bz file>`
