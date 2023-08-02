#!/bin/bash -l

# SLURM directives
#
# This is an array job with four subtasks 
#SBATCH --reservation=UWATraining
#SBATCH --account=courses01
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --array=1-4
#SBATCH --mem-per-cpu=1000M
#SBATCH --time=00:05:00
#SBATCH --export=NONE
#SBATCH --output=MYJOB-%j.log
 

#Do not edit the echo sections
echo "All jobs in this array have:"
echo "- SLURM_ARRAY_JOB_ID=${SLURM_ARRAY_JOB_ID}"
echo "- SLURM_ARRAY_TASK_COUNT=${SLURM_ARRAY_TASK_COUNT}"
echo "- SLURM_ARRAY_TASK_MIN=${SLURM_ARRAY_TASK_MIN}"
echo "- SLURM_ARRAY_TASK_MAX=${SLURM_ARRAY_TASK_MAX}"
echo "This job in the array has:"
echo "- SLURM_JOB_ID=${SLURM_JOB_ID}"
echo "- SLURM_ARRAY_TASK_ID=${SLURM_ARRAY_TASK_ID}"


# Load Blast+ module
module load blast/2.12.0--pl5262h3289130_0

# Run Blast comparisons
blastp -use_sw_tback -query ${SLURM_ARRAY_TASK_ID}.fasta -db zebrafish.1.protein.faa -out result${SLURM_ARRAY_TASK_ID}.txt
