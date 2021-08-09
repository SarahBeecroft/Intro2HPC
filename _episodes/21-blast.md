---
title: "Running BLAST on HPC"
teaching: 0
exercises: 20
questions:
objectives:
- Run a real-world bioinformatics application on HPC
keypoints:
- Submit jobs to the queue using a job script
- `#SBATCH` flags allow you to change resource allocations, jobs names and other aspects of your job 
---


### Goal

In this exercise, you're going to download BLAST reference sequences to Zeus, make a BLAST database, and run queries in series (one at a time). 

The demo directory `exercises/sequential` contains two scripts. One script is to download the fasta files, and the other is to perform the BLAST query.

Before you start, `cd` into the appropriate directory:

```bash
cd $MYSCRATCH/Intro2HPC/exercises/sequential
```

> ## Run a BLAST query using sbatch scripting
> To set your job script running
> 
> ```bash
> sbatch blast.sh
> ```
> 
> Let's look at the contents of blast.sh with `cat blast.sh`. Can you answer:
>   1. How long was the job time limit set for?
>   2. How many BLAST comparisons were run in this script? 
>   3. This script will launch both the download script and perform the BLAST query. How did it manage that?
>   
> > ## Solution
> > 1. 5 minutes (`#SBATCH --time=00:05:00`
> > 2. 4 comparisons (see the 4 lines under `# Run Blast comparisons`)
> > 3. The blast.sh script executes the `download.sh` script using `bash download.sh`. This is run within the existing job, and saves you the hassle of launching two job scripts. 
> {: .solution}
>  
> How can you check the status of your job(s) and view the job ID while they're running?
> 
> > ## Solution
> > `squeue -u username`
> {: .solution}
{: .challenge}


The final results are stored in `result1.txt` to `result4.txt`:

```bash
less result1.txt
```

```output
Query= sp|Q4LEZ3|AARD_HUMAN Alanine and arginine-rich domain-containing
protein OS=Homo sapiens OX=9606 GN=AARD PE=1 SV=1

Length=155
                                                                      Score     E
Sequences producing significant alignments:                          (Bits)  Value

XP_003200692.1 protein FAM167A-like [Danio rerio]                     47.0    6e-07
NP_001020721.1 protein FAM167A [Danio rerio]                          38.1    0.003
XP_005160526.1 protein FAM167A isoform X1 [Danio rerio]               38.1    0.003
XP_005160525.1 protein FAM167A isoform X1 [Danio rerio]               38.1    0.003
XP_021328850.1 protein FAM167B [Danio rerio]                          32.0    0.25 
XP_001923404.1 protein FAM167B [Danio rerio]                          32.0    0.25 
NP_001116846.1 serine hydroxymethyltransferase, mitochondrial [Da...  32.0    0.42 
NP_001017854.1 autophagy-related protein 16-1 [Danio rerio]           30.0    1.8  
NP_998623.1 SH3 domain-binding protein 5b [Danio rerio]               28.9    4.7  
NP_001076492.1 uncharacterized protein LOC100009654 [Danio rerio]     28.5    6.3  
NP_998042.1 serpin peptidase inhibitor, clade B (ovalbumin), memb...  28.1    6.5  
NP_001038588.1 sodium channel, voltage gated, type V-like, alpha ...  28.1    8.3 
[..]
```

When you're done, quit the view by hitting the `q` button.

Well done, you've just BLASTed some sequences!
