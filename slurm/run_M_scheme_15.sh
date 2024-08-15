#!/bin/bash

cd ~/macro_dr/macro_dr



RUNTIME="2-00:00"

export PATH_MACRO=/home/lmoffatt/macro_dr/

# Cargar los módulos para la tarea
module load cmake
module load gcc

module load amdblis
module load amdlibflame
module load gsl


export NTASKS=2
CPUSPERTASK=32
export CP=$CPUSPERTASK



export USE_LOCAL_ID=1

export SCHEME_DIR_0=models
export SCHEME_DIR_1=models_Ag



export PATH_MACRO_DR_0=v31
export PATH_MACRO_DR_1=$PATH_MACRO_DR_0

export PATH_MACRO_DRX=v32


export EXPERIMENT_0=idealize_experiment_2
export EXPERIMENT_1=$EXPERIMENT_0

export N_BETA=32

export N_SCOUTS=32

export MAX_ITER=1000000

export EVIDENCE_ALGORITHM=thermo

export CONTINUATION_NUMBER=0

export N_SCH=15
export SCHEME_0=scheme_${N_SCH}_inact_PI
export SCHEME_1=$SCHEME_0



export CONTINUATION_NUMBER=0
JOBID1=$(sbatch --parsable --job-name=R${N_SCH}_${CPUSPERTASK} --ntasks-per-node=${NTASKS} --cpus-per-task=${CPUSPERTASK}  --time=${RUNTIME} --partition=multi  ${PATH_MACRO}/macro_dr/slurm/M_scheme_N_tasks.sh) 

#export CONTINUATION_NUMBER=1
#JOBID1=$(sbatch --parsable --dependency=afterany:$JOBID1 --job-name=C${N_SCH}_${CPUSPERTASK}_${CONTINUATION_NUMBER} --ntasks-per-node=${NTASKS} --cpus-per-task=${CPUSPERTASK}  --time=${RUNTIME} --partition=multi ${PATH_MACRO}/macro_dr/slurm/M_scheme_N.sh) 

#export CONTINUATION_NUMBER=2
#JOBID1=$(sbatch --parsable --dependency=afterany:$JOBID1 --job-name=C${N_SCH}_${CPUSPERTASK}_${CONTINUATION_NUMBER} --ntasks-per-node=${NTASKS} --cpus-per-task=${CPUSPERTASK}  --time=${RUNTIME} --partition=multi ${PATH_MACRO}/macro_dr/slurm/M_scheme_N.sh) 

#export CONTINUATION_NUMBER=3
#JOBID1=$(sbatch --parsable --dependency=afterany:$JOBID1 --job-name=C${N_SCH}_${CPUSPERTASK}_${CONTINUATION_NUMBER} --ntasks-per-node=${NTASKS} --cpus-per-task=${CPUSPERTASK}  --time=${RUNTIME} --partition=multi  ${PATH_MACRO}/macro_dr/slurm/M_scheme_N.sh) 

#export CONTINUATION_NUMBER=4
#JOBID1=$(sbatch --parsable --dependency=afterany:$JOBID1 --job-name=C${N_SCH}_${CPUSPERTASK}_${CONTINUATION_NUMBER} --ntasks-per-node=${NTASKS} --cpus-per-task=${CPUSPERTASK}  --time=${RUNTIME} --partition=multi ${PATH_MACRO}/macro_dr/slurm/M_scheme_N.sh) 

#export CONTINUATION_NUMBER=5
#JOBID1=$(sbatch --parsable --dependency=afterany:$JOBID1 --job-name=C${N_SCH}_${CPUSPERTASK}_${CONTINUATION_NUMBER} --ntasks-per-node=${NTASKS} --cpus-per-task=${CPUSPERTASK}  --time=${RUNTIME} --partition=multi ${PATH_MACRO}/macro_dr/slurm/M_scheme_N.sh) 

