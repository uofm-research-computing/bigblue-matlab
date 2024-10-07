#!/bin/bash
#SBATCH --cpus-per-task=5
#SBATCH --mem-per-cpu=2G
#SBATCH --partition=acomputeq
#SBATCH --time=00:05:00
#SBATCH --job-name=matlabTest

module load matlab

matlab -nosplash -nodesktop -nodisplay -r "test($SLURM_CPUS_PER_TASK);quit" -logfile test.log
