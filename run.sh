#!/bin/sh

blockMesh 

surfaceFeatureExtract 

snappyHexMesh -overwrite 

setFields

decomposePar 

mpirun -np 7 interFoam -parallel 

reconstructPar 

rm -rf proc* 
