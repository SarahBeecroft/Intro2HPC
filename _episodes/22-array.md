---
title: "BLAST using a job array"
teaching: 0
exercises: 30
questions:
objectives:
- Re-run BLAST queries in parellel using a job array
keypoints:
- Job arrays are an efficient way of running multiple jobs in parallel
- Specify a job array with `#SBATCH --array` flag
---


### Setting up a job array
Why use a job array?
Job arrays are really useful when you need to run the same program over a number of files. In non-supercomputing environments, you might use a (for) loop or gnu parallel. However, we can make slurm perform parallelisation for us with minimal effort by making use of the `--array` flag.

Make sure you're in the right directory
```bash
cd $MYSCRATCH/Intro2HPC/exercises/jobarray
```

> ## Use two terminal windows if you can
>
> If you can, open at least two terminal windows, and connect to the VM from both of them.  In this way, you can use one to edit files, and one to execute commands, thus making your workflow more efficient.
{: .callout}


> ## How to setup an array
> Let's adapt the code from our previous (blast.sh). For convenience, a version of this is provded for you in the current directory, titled `blast_array.sh`. 
> As you remember, the script ran 4 BLAST queries, one after the other. Each input file had an identifier of a number from 1-4, and the results were also identified from 1-4. Let's look at the commands to refresh
> ```bash
> blastp -use_sw_tback -query 1.fasta -db zebrafish.1.protein.faa -out result1.txt
> blastp -use_sw_tback -query 2.fasta -db zebrafish.1.protein.faa -out result2.txt
> blastp -use_sw_tback -query 3.fasta -db zebrafish.1.protein.faa -out result3.txt
> blastp -use_sw_tback -query 4.fasta -db zebrafish.1.protein.faa -out result4.txt
> ```
> The flag to set an array is `#SBATCH --array=A-Z`, where A and Z specify the start and end of a range of numbers. 
> 
> You can also specify specific numbers (e.g. `#SBATCH --array=1,3`. 
> 
> You can even combine the notation, for example `#SBATCH --array=1,3-4`
> 
> What range would you set in your jobscript `blast_array.sh` to have the script launch all 4 jobs?
> 
> > Solution
> > 
> > `#SBATCH --array=1-4`
> > 
> 
>
> Now, edit your job script to include the job array line with your favourite text editor (e.g. nano, emacs, vim. If you're not sure, choose nano.)
> ```bash
> nano blast_array.sh
> ```
> Hit `ctrl + o` to save your changes, and `ctrl + x` to exit nano.
> Now submit your script with `sbatch blast_array.sh`
> Watch your jobs get spawned with `watch squeue -u username`
> Hit `ctrl + c` to exit out from watching the job queue.
> Check your results files with `less resultN.txt` where N is a number from 1-4. Did it work ok?
> {: .solution}
{: .challenge}

### What if your files don't have numerical based naming?
In many bioinformatics workflows, your file names will have non-standard formats. How can you run a job array on some files that are aren't labelled in some ordered fashion, and it doesn't make sense to rename them all? One way is to base the array around a regular expression using the file names and extensions. For example, let's say our files are called
```output
zeb_Q4LEZ3.fasta
zeb_Q96SE0.fasta 
zeb_Q9UGJ0.fasta 
zeb_Q9H221.fasta 
```

Let's look at how we could handle this common issue

