#!/bin/bash

set -e

# make sure to run /grackle-swift/configure first

# also make sure to create the parent directory where you want to
# install your grackle installation first
# mkdir -p $HOME/local/grackle-swift_intel2021.1.0
# mkdir -p $HOME/local/grackle-swift_oneAPI2022.3.0
# mkdir -p $HOME/local/grackle-swift_intel2021-cosma7
# mkdir -p $HOME/local/grackle-swift_intel2022-DINE

module purge
# module restore swift-wiki-cosma8
# for cosma 8, according to swift wiki:
# module load intel_comp/2021.1.0 compiler
# module load intel_mpi/2018
# module load ucx/1.10.1
# module load fftw/3.3.9epyc parallel_hdf5/1.10.6 parmetis/4.0.3-64bit gsl/2.5


# for cosma 7, according to swift wiki:
# module load intel_comp/2021.1.0 compiler
# module load intel_mpi/2018
# module load ucx/1.10.3
# module load fftw/3.3.9cosma7 # or fftw/3.3.9 on cosma 5 & 6
# module load parallel_hdf5/1.10.6 parmetis/4.0.3-64bit gsl/2.5
# module restore swift-wiki-cosma7
# module restore swift-gcc
module restore swift-wiki-cosma8

# module restore swift-wiki-DINE

make clean
make opt-aggressive
# make machine-DINE-intel-2022
# make machine-cosma7-intel2021
# make machine-DINE-gcc
make machine-cosma8-oneAPI-2024
make -j
make install
