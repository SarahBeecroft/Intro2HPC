---
title: "Running BLAST on HPC"
teaching: 0
exercises: 20
questions:
objectives:
- Run a real-world bioinformatics applicationon HPC
keypoints:
- xxxx 
---


### Goal

In this exercise, you're going to download BLAST reference sequences to Zeus, make a BLAST database, and run queries in series (one at a time). 

Now, the demo directory `exercises/sequential` contains two scripts. One script is to download the fasta files, and the other is to perform the BLAST query.

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
> This script will launch both the download script and perform the BLAST query. How did it manage that? Hint: use `cat blast.sh` to view the contents of the script.
> > ## Solution
> > The blast.sh script executes the `download.sh` script. This is run within the existing job, and saves ypu the hassle of launching two job scripts. 
> {: .solution}
>  
> How can you check the status of these jobs and view the job ID while they're running?
> 
> > ## Solution
> > `squeue -u username`
> {: .solution}
{: .challenge}


Now, the demo directory `exercises/blast_1` contains a human prion FASTA sequence, `P04156.fasta`, as well as a gzipped reference database to blast against, `zebrafish.1.protein.faa.gz`.  Let us uncompress the database first:

```bash
gunzip zebrafish.1.protein.faa.gz
```


> ## Prepare the database
>
> You now need to prepare the zebrafish database with `makeblastdb` for the search, using the following command through a container:
>
> ```bash
> makeblastdb -in zebrafish.1.protein.faa -dbtype prot
> ```
>
> Try and run it via Singularity.
>
> > ## Solution
> >
> > ```bash
> > singularity exec blast_2.9.0--pl526h3066fca_4.sif makeblastdb -in zebrafish.1.protein.faa -dbtype prot
> > ```
> > ```output
> > Building a new DB, current time: 11/16/2019 19:14:43
> > New DB name:   /data/bio-intro-containers/exercises/blast_1/zebrafish.1.protein.faa
> > New DB title:  zebrafish.1.protein.faa
> > Sequence type: Protein
> > Keep Linkouts: T
> > Keep MBits: T
> > Maximum file size: 1000000000B
> > Adding sequences from FASTA; added 52951 sequences in 1.34541 seconds.
> > ```
> {: .solution}
{: .challenge}


After the container has terminated, you should see several new files in the current directory (try `ls`).  
Now let's proceed to the final alignment step using `blastp`. 


> ## Run the alignment
>
> Adapt the following command to run into the container:
>
> ```bash
> blastp -query P04156.fasta -db zebrafish.1.protein.faa -out results.txt
> ```
>
> > ## Solution
> >
> > ```bash
> > blastp -query P04156.fasta -db zebrafish.1.protein.faa -out results.txt
> > ```
> {: .solution}
{: .challenge}

The final results are stored in `results.txt`:

```bash
less results.txt
```

```output
                                                                      Score     E
Sequences producing significant alignments:                          (Bits)  Value

  XP_017207509.1 protein piccolo isoform X2 [Danio rerio]             43.9    2e-04
  XP_017207511.1 mucin-16 isoform X4 [Danio rerio]                    43.9    2e-04
  XP_021323434.1 protein piccolo isoform X5 [Danio rerio]             43.5    3e-04
  XP_017207510.1 protein piccolo isoform X3 [Danio rerio]             43.5    3e-04
  XP_021323433.1 protein piccolo isoform X1 [Danio rerio]             43.5    3e-04
  XP_009291733.1 protein piccolo isoform X1 [Danio rerio]             43.5    3e-04
  NP_001268391.1 chromodomain-helicase-DNA-binding protein 2 [Dan...  35.8    0.072
[..]
```

When you're done, quit the view by hitting the `q` button.

Well done, you've just BLASTed some sequences!
