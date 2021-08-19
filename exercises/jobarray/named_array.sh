#!/bin/bash -l

# SLURM directives
#
# This is an array job with four subtasks 
#SBATCH --reservation=UWAHPC
#SBATCH --account=courses01
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1000M
#SBATCH --time=00:05:00
#SBATCH --job-name=named_array
#SBATCH --export=NONE
#SBATCH --output=named_array-%j.log

# EDIT THIS LINE
#SBATCH --array=
 
#Do not edit the echo sections
echo "All jobs in this array have:"
echo "- SLURM_ARRAY_JOB_ID=${SLURM_ARRAY_JOB_ID}"
echo "- SLURM_ARRAY_TASK_COUNT=${SLURM_ARRAY_TASK_COUNT}"
echo "- SLURM_ARRAY_TASK_MIN=${SLURM_ARRAY_TASK_MIN}"
echo "- SLURM_ARRAY_TASK_MAX=${SLURM_ARRAY_TASK_MAX}"
echo "This job in the array has:"
echo "- SLURM_JOB_ID=${SLURM_JOB_ID}"
echo "- SLURM_ARRAY_TASK_ID=${SLURM_ARRAY_TASK_ID}"
 
 
# EDIT THIS LINE Add your regular expression here

 
# EDIT THIS LINE grab filename from directory listing


# Swap gcc module version
module swap gcc/4.8.5 gcc/8.3.0

# Load Blast+ module
module load blast+

# Run Blast comparisons
blastp -use_sw_tback -query ${FILENAME} -db zebrafish.1.protein.faa -out result.${FILENAME}.txt
