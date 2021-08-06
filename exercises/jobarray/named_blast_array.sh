#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=1:00:00
#SBATCH --job-name=MYJOB
#SBATCH --partition=workq
#SBATCH --account=MYACCOUNT
#SBATCH --output=MYJOB-%j.log
#SBATCH --error=MYJOB-%J.log
 
#Do not edit the echo sections
echo "All jobs in this array have:"
echo "- SLURM_ARRAY_JOB_ID=${SLURM_ARRAY_JOB_ID}"
echo "- SLURM_ARRAY_TASK_COUNT=${SLURM_ARRAY_TASK_COUNT}"
echo "- SLURM_ARRAY_TASK_MIN=${SLURM_ARRAY_TASK_MIN}"
echo "- SLURM_ARRAY_TASK_MAX=${SLURM_ARRAY_TASK_MAX}"
echo "This job in the array has:"
echo "- SLURM_JOB_ID=${SLURM_JOB_ID}"
echo "- SLURM_ARRAY_TASK_ID=${SLURM_ARRAY_TASK_ID}"
 
 
# alter the following line to suit your files. It will grab all files matching whatever regular expression you provide.
FILES=($(ls -1 *.bam))
 
# grabs our filename from a directory listing
FILENAME=${FILES[$SLURM_ARRAY_TASK_ID]}
echo "My input file is ${FILENAME}"
 
#load modules
module load blast+
