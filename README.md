# MATLAB on bigblue
## Introduction
There are two workflows for matlab:
1. Interactive - run matlab application with either graphical user interface or command line interface
2. Batch - run matlab with slurm batch command

To initialize this example, please SSH to bigblue and run:
```
git clone https://github.com/uofm-research-computing/bigblue-matlab.git
```

## Interactive
The interactive workflow is typically used for testing or setting up a larger job. Don't run matlab on the login node directly unless your test or dataset is quite small. If you really need a graphical user interface, you might consider running testing locally on your device since your connection might be slow or laggy. The command line interface is about as quick as a normal SSH terminal. Additionally, if you ever lose connection to the cluster, your job will likely terminate.

### Graphical User Interface
Procedure:
1. Connect to bigblue1.memphis.edu or bigblue2.memphis.edu with X2Go.
2. Open a terminal.
3. Run the command `module load matlab; srun --cpus-per-task 4 --mem=8G --time=00:10:00 --x11 --pty matlab`.
4. Wait for job to start. If the job doesn't start soon, try reducing resource parameters like `--mem`, `--cpus-per-task`, or `--time`.
5. Matlab window should start!

### Command Line Interface
Procedure:
1. SSH to bigblue.memphis.edu with an ssh terminal.
2. Run the command `module load matlab; srun --cpus-per-task 4 --mem=8G --time=00:10:00 --x11 --pty matlab`
3. Wait for job to start. If the job doesn't start soon, try reducing resource parameters like `--mem`, `--cpus-per-task`, or `--time`.
4. Matlab terminal should start!

## Batch
The batch workflow is the most common workflow on large datasets for HPC environments. Submission to the scheduler means you can logout at anytime, wait for your job to finish, and login to check the results. The scheduler won't send you an email unless you include the following lines your sbatch submission script:
```
#SBATCH --mail-user=username@memphis.edu
#SBATCH --mail-type=ALL
```

Procedure:
1. SSH to bigblue.
2. Run the command `sbatch matlabSubmit.sh`.
3. Check the status of the job with `squeue -u $USER`.
4. If the job is finished, you might want to run `sacct -u $USER` to see if it finished.
5. Use your favorite method (scp, winscp, mobaxterm, etc... to retrieve your results).

## Citations and Reading material
[matlab help](https://www.mathworks.com/help/matlab/index.html)

[matlab linux command](https://www.mathworks.com/help/matlab/ref/matlablinux.html)


