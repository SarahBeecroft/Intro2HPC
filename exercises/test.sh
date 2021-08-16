#!/bin/bash -l
#SBATCH --reservation=UWAHPC
#SBATCH --account=courses01
#SBATCH --n-tasks=1
#SBATCH --time=00:05:00
#SBATCH --export=NONE

echo 'I am a test job`
echo `sleeping for 5 minutes`
sleep 5m
