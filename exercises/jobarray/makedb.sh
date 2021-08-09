#!/bin/bash -l
#SBATCH --reservation=UWAHPC
#SBATCH -n 1 
#SBATCH -A courses01
#SBATCH -t 00:05:00
#SBATCH --export=NONE

# Swap gcc module version
module swap gcc/4.8.5 gcc/8.3.0

# Load Blast+ module
module load blast+

bash download.sh

# Make Blast DB
makeblastdb -in zebrafish.1.protein.faa -dbtype prot
