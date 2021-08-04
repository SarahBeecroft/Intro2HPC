#!/bin/bash -l
#SBATCH --reservation=UWAHPC
#SBATCH -A courses01
#SBATCH -n 1
#SBATCH -t 00:05:00
#SBATCH --export=NONE

# Load Blast+ module
module load blast+

# Download file
./download.sh

# Make Blast DB
makeblastdb -in zebrafish.1.protein.faa -dbtype prot

# Run Blast comparisons
blastp -use_sw_tback -query 1.fasta -db zebrafish.1.protein.faa -out result1.txt
blastp -use_sw_tback -query 2.fasta -db zebrafish.1.protein.faa -out result2.txt
blastp -use_sw_tback -query 3.fasta -db zebrafish.1.protein.faa -out result3.txt
blastp -use_sw_tback -query 4.fasta -db zebrafish.1.protein.faa -out result4.txt
