Reference:
----------

https://github.com/conda/conda-recipes

To build: 
---------
Within the folder, set $PREFIX as conda installed directory, then run `"conda-build ."`

To upload:
----------
1. `anaconda login`
2. `anaconda upload <location of conda>/conda-bld/<target architecture>/<created .tar.bz file>`
