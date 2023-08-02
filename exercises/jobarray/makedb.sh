#!/bin/bash -l
#SBATCH --reservation=UWATraining
#SBATCH -A courses01
#SBATCH -n 1 
#SBATCH -t 00:05:00
#SBATCH --export=NONE

# Load Blast+ module
module load blast/2.12.0--pl5262h3289130_0
bash download.sh

# Make Blast DB
makeblastdb -in zebrafish.1.protein.faa -dbtype prot
