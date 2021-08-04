#!/bin/bash -l
#SBATCH --reservation=UWAHPC
#SBATCH -n 1 
#SBATCH --array=1-4
#SBATCH -A courses01
#SBATCH -t 00:05:00
#SBATCH --export=NONE

# Load Blast+ module
module load blast+

# Run Blast comparisons
blastp -use_sw_tback -query ${SLURM_ARRAY_TASK_ID}.fasta -db zebrafish.1.protein.faa -out result${SLURM_ARRAY_TASK_ID}.txt
