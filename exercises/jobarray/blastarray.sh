#!/bin/bash -l

# SLURM directives
#
# This is an array job with four subtasks 

#SBATCH --reservation=UWAHPC
#SBATCH -n 1 
#SBATCH --array=0-3
#SBATCH -A courses01
#SBATCH -t 00:05:00
#SBATCH --export=NONE
 
 
echo This job shares a SLURM array job ID with the parent job: $SLURM_ARRAY_JOB_ID
echo This job has a SLURM job ID: $SLURM_JOBID
echo This job has a unique SLURM array index: $SLURM_ARRAY_TASK_ID


# Load Blast+ module
module load blast+

# Run Blast comparisons
blastp -use_sw_tback -query ${SLURM_ARRAY_TASK_ID}.fasta -db zebrafish.1.protein.faa -out result${SLURM_ARRAY_TASK_ID}.txt
