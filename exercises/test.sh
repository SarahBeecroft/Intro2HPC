#!/bin/bash -l
#SBATCH --reservation=UWAHPC
#SBATCH --account=courses01
#SBATCH --nodes=1
#SBATCH --cores=1
#SBATCH --mem-per-cpu=100M
#SBATCH --time=00:05:00
#SBATCH --export=NONE

echo 'I am a test job`
echo `sleeping for 5 minutes`
sleep 5m
