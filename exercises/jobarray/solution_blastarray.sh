#!/bin/bash -l

# SLURM directives
#
# This is an array job with four subtasks 
#SBATCH --reservation=UWAHPC
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --array=1-4
#SBATCH --account=courses01
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


# Swap gcc module version
module swap gcc/4.8.5 gcc/8.3.0

# Load Blast+ module
module load blast+

# Run Blast comparisons
blastp -use_sw_tback -query ${SLURM_ARRAY_TASK_ID}.fasta -db zebrafish.1.protein.faa -out result${SLURM_ARRAY_TASK_ID}.txt
