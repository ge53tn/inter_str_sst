#!/bin/sh

blockMesh // > log.blockMesh 2>&1

surfaceFeatureExtract // > log.surfaceFeatureExtract 2>&1

snappyHexMesh -overwrite // > log.snappyHexMesh 2>&1

setFields

//rm log.*

decomposePar // > log.decomposePar 2>&1

mpirun -np 8 interFoam -parallel // > log.simpleFoam 2>&1

reconstructPar // > log.reconstructPar 2>&1

rm -rf proc* //dene

