# Grackle-Swift

This is a fork of the [grackle](https://github.com/grackle-project/grackle) 
library, intended to keep a frozen version of the library which is known and 
tested to work with GEAR-RT in [swift](https://github.com/SWIFTSIM/swiftsim) 
publicly available.

All installation instructions and dependencies remain identical to the upstream
Grackle package. The upstream Grackle readme is shown below.

There a script is included to set up grackle on cosma (8) with the Intel 2021
compiler suite. Look through `src/clib/Make.mach.cosma8-intel2021` and check
that all paths are set correctly and up to date. Then run `src/clib/myinstall.sh`.
(Don't forget to first run ./configure).


## Grackle-Swift as a spack package

Additionally, I've added the relevant files to make grackle-swift available as a 
[spack](https://github.com/spack/spack) package. The installation is 
straightforward:

- Copy the directory `/grackle-swift/spack/var/spack/repos/builtin/packages/grackle-swift` 
and its contents into the corresponding directory in your spack clone (in the 
spack clone, the directory `/spack/var/spack/repos/builtin/packages` should exist 
by default. That's where spack keeps all its packages.)
- **IMPORTANT**: Copy and use the files stored in the `main` branch. Do not use 
the files stored in the `freeze` branch. (Spack requires an md5sum to verify the
integrity of the downloaded files. The stored md5sum in the `freeze` branch will 
be wrong, and spack will refuse to install it. Correcting the md5sum on the `freeze`
branch changes its md5sum, making it wrong again. So that won't work.)
- install grackle-swift the way you would install any other package with spack. E.g.
```
$ spack install grackle-swift
```
or
```
$ spack install grackle-swift ^hdf5@1.12.2 %gcc@12.1.0
```
or ...


NOTE: The file was changed to work with `spack` for spack's `develop` branch on commit
`5f58a4c0792071ca4e681e43724fe7c66c2cefce`

Here's the diff:
```
diff --git i/spack/var/spack/repos/builtin/packages/grackle-swift/package.py w/spack/var/spack/repos/builtin/packages/grackle-swift/package.py
index f24c17d..4d9ce4f 100644
--- i/spack/var/spack/repos/builtin/packages/grackle-swift/package.py
+++ w/spack/var/spack/repos/builtin/packages/grackle-swift/package.py
@@ -35,7 +35,7 @@ class GrackleSwift(Package):
         template_name = "{0.architecture}-{0.compiler.name}"
         grackle_architecture = template_name.format(spec)
         link_variables = (
-            "MACH_AR = ar" if spec.version < Version(2.2) else "MACH_LIBTOOL = libtool"
+            "MACH_AR = ar" if spec.version < Version("2.2") else "MACH_LIBTOOL = libtool"
         )
         substitutions = {
             "@ARCHITECTURE": grackle_architecture,
```




# Grackle

[![Users' Mailing List](https://img.shields.io/badge/Users-List-lightgrey.svg)](https://groups.google.com/forum/#!forum/grackle-cooling-users)
[![CircleCI](https://circleci.com/gh/grackle-project/grackle/tree/main.svg?style=svg)](https://circleci.com/gh/grackle-project/grackle/tree/main)
[![Documentation Status](https://readthedocs.org/projects/grackle/badge/?version=latest)](https://grackle.readthedocs.io/en/latest/?badge=latest)

Grackle is a chemistry and radiative cooling library for astrophysical
simulations and models.  Grackle has interfaces for C, C++, Fortran, and
Python codes and provides:

- two options for primordial chemistry and cooling:

   1. non-equilibrium primordial chemistry network for atomic H, D, and He
   as well as H<sub>2</sub> and HD, including H<sub>2</sub> formation on dust grains.

   2. tabulated H and He cooling rates calculated with the photo-ionization
      code, [Cloudy](http://nublado.org).

- tabulated metal cooling rates calculated with [Cloudy](http://nublado.org).

- photo-heating and photo-ionization from two UV backgrounds with optional
  self-shielding corrections:

   1. [Faucher-Giguere et al. (2009)](http://adsabs.harvard.edu/abs/2009ApJ...703.1416F).

   2. [Haardt & Madau (2012)](http://adsabs.harvard.edu/abs/2012ApJ...746..125H).

- support for user-provided arrays of volumetric and specific heating rates.

The Grackle provides functions to update chemistry species; solve radiative
cooling and update internal energy; and calculate cooling time, temperature,
pressure, and ratio of specific heats (gamma).

For more information on features, installation, and integration with simulation
codes and models, see our [online documentation](https://grackle.readthedocs.io/).

## Resources

- documentation: https://grackle.readthedocs.io/

- source code repository: https://github.com/grackle-project/grackle

- method paper: [Smith et al. (2017)](http://adsabs.harvard.edu/abs/2017MNRAS.466.2217S)
