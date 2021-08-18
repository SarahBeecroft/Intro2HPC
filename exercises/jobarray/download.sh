#!/bin/bash -l
#SBATCH -A courses01
#SBATCH -M zeus
#SBATCH -p copyq
#SBATCH -n 1 
#SBATCH -t 00:05:00
#SBATCH --export=NONE

wget https://www.uniprot.org/uniprot/Q4LEZ3.fasta -O 1.fasta
wget https://www.uniprot.org/uniprot/Q96SE0.fasta -O 2.fasta
wget https://www.uniprot.org/uniprot/Q9UGJ0.fasta -O 3.fasta
wget https://www.uniprot.org/uniprot/Q9H221.fasta -O 4.fasta

wget https://www.uniprot.org/uniprot/Q4LEZ3.fasta -O zebrafish_Q4LEZ3.fasta
wget https://www.uniprot.org/uniprot/Q96SE0.fasta -O zebrafish_Q96SE0.fasta
wget https://www.uniprot.org/uniprot/Q9UGJ0.fasta -O zebrafish_Q9UGJ0.fasta
wget https://www.uniprot.org/uniprot/Q9H221.fasta -O zebrafish_Q9H221.fasta
curl -O ftp://ftp.ncbi.nih.gov/refseq/D_rerio/mRNA_Prot/zebrafish.1.protein.faa.gz
gunzip -f zebrafish.1.protein.faa.gz
