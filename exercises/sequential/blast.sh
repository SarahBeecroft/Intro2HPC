#!/bin/bash -l
#SBATCH --reservation=UWA
#SBATCH --account=courses01
#SBATCH --ntasks=1
#SBATCH --mem=1000M
#SBATCH --time=00:05:00
#SBATCH --export=NONE

# Load Blast+ module
module load blast/2.12.0--pl5262h3289130_0

# Download file
bash download.sh

# Make Blast DB
makeblastdb -in zebrafish.1.protein.faa -dbtype prot

# Run Blast comparisons
blastp -use_sw_tback -query 1.fasta -db zebrafish.1.protein.faa -out result1.txt
blastp -use_sw_tback -query 2.fasta -db zebrafish.1.protein.faa -out result2.txt
blastp -use_sw_tback -query 3.fasta -db zebrafish.1.protein.faa -out result3.txt
blastp -use_sw_tback -query 4.fasta -db zebrafish.1.protein.faa -out result4.txt
