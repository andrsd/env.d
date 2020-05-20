export JOBS=7
export MOOSE_JOBS=7

module load tbb
module load gfortran/8.3.0
module load clang/8.0.0
module load llvm-opt
module load mpich/3.3
module load ccache
module load libmesh
module load petsc/3.11.4
module load env/opt
module load conda

export METHODS="opt dbg"
