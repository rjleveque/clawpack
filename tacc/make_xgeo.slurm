#!/bin/bash
#SBATCH -J job-xgeo           # Job name
#SBATCH -o job-xgeo.o%j       # Name of stdout output file
#SBATCH -e job-xgeo.e%j       # Name of stderr error file
#SBATCH -p skx-dev         # Queue (partition) name
#SBATCH -N 1               # Total # of nodes 
#SBATCH -n 1               # Total # of mpi tasks
#SBATCH -t 00:05:00        # Run time (hh:mm:ss)
##SBATCH --mail-user=username@tacc.utexas.edu
##SBATCH --mail-type=all    # Send email at begin and end of job
#SBATCH -A DS-portal-rjl    # Allocation name (req'd if you have more than 1)

# Other commands must follow all #SBATCH directives...

export FC=ifx
export FFLAGS='-O2 -fopenmp'
export OMP_NUM_THREADS=10
export NPROCS=1  # NPROCS * OMP_NUM_THREADS <= 45

export CHT=$HOME/CopesHubTsunamis  # for this project
export CLAW=/work2/04137/rjl/CHTshare/clawpack-CHTshare
export EXE=$CLAW/tacc/xgeoclaw_260113
export PYTHONPATH=$PYTHONPATH:$CLAW

date
pwd
module list
echo CHT=$CHT
echo CLAW=$CLAW
echo PYTHONPATH=$PYTHONPATH

make new

date
