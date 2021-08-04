#!/bin/bash -l
#SBATCH --reservation=UWAHPC
#SBATCH -n 1 
#SBATCH -A courses01
#SBATCH -t 00:05:00
#SBATCH --export=NONE

# Load Blast+ module
module load blast+

# Make Blast DB
makeblastdb -in zebrafish.1.protein.faa -dbtype prot
