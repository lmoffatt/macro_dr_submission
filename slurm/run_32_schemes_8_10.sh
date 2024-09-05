#!/bin/bash

export NTASKS=2
CPUSPERTASK=16

export CP=$CPUSPERTASK

export USE_LOCAL_ID=1

export N_SCH=8
N_SCH2=10

export SCHEME_0=scheme_${N_SCH}_inact_PI
export SCHEME_1=scheme_${N_SCH2}_inact_PI



export SCHEME_DIR_0=models_Ag
export SCHEME_DIR_1=models_Ag

export PATH_MACRO_DR_0=w5
export PATH_MACRO_DR_1=$PATH_MACRO_DR_0





export LIK_0=DR
export LIK_1=$LIK_0





export EXPERIMENT_0=idealize_experiment_2
export EXPERIMENT_1=$EXPERIMENT_0


export N_BETA=4

export N_SCOUTS=32

export MAX_ITER=1000000




export CONTINUATION_NUMBER=0

#JOBID1=$(sbatch --parsable --job-name=R${N_SCH}_${CPUSPERTASK}  --partition=${PARTITION} --ntasks-per-node=${NTASKS} --cpus-per-task=${CPUSPERTASK}  --time=${RUNTIME}  ${PATH_MACRO}/macro_dr/slurm/M_scheme_N_tasks.sh) 

JOBID1=83742


for i in $(seq 7 15);
do
    export CONTINUATION_NUMBER=$i
    JOBID1=$(sbatch --parsable --dependency=afterany:$JOBID1 --job-name=C${N_SCH}_${CPUSPERTASK}_${CONTINUATION_NUMBER}   --partition=${PARTITION} --ntasks-per-node=${NTASKS} --cpus-per-task=${CPUSPERTASK}  --time=${RUNTIME}  ${PATH_MACRO}/macro_dr/slurm/M_scheme_N_tasks.sh) 
done



