#!/bin/bash

. /etc/profile

# Configure OpenMP and other thread-using libraries using the values specified above
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export MKL_NUM_THREADS=$SLURM_CPUS_PER_TASK

#your can run cluster specific initialization here
#source ${PATH_MACRO}/macro_dr/clusters/${CLUSTER}.sh
    
# run the program 
srun ${PATH_MACRO}/macro_dr/slurm/multi_task_M_scheme_N_tasks.sh


