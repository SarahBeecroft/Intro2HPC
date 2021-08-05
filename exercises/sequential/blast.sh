#!/bin/bash -l
#SBATCH --reservation=UWAHPC
#SBATCH --account=courses01
#SBATCH --n-tasks=1
#SBATCH --time=00:05:00
#SBATCH --export=NONE

# Swap gcc module version
module swap gcc/4.8.5 gcc/8.3.0

# Load Blast+ module
module load blast+

# Download file
bash download.sh

# Make Blast DB
makeblastdb -in zebrafish.1.protein.faa -dbtype prot

# Run Blast comparisons
blastp -use_sw_tback -query 1.fasta -db zebrafish.1.protein.faa -out result1.txt
blastp -use_sw_tback -query 2.fasta -db zebrafish.1.protein.faa -out result2.txt
blastp -use_sw_tback -query 3.fasta -db zebrafish.1.protein.faa -out result3.txt
blastp -use_sw_tback -query 4.fasta -db zebrafish.1.protein.faa -out result4.txt
