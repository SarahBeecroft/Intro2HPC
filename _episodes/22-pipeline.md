---
title: "BLAST using a job array"
teaching: 0
exercises: 30
questions:
objectives:
- Re-run BLAST queries in parellel using a job array
keypoints:
- Job arrays are an efficient way of running multiple jobs in parallel
- Specify a job array with XXX command
---


### Goal 1: BLAST reprise

For use when you need to run the same program over a number of files. In non-supercomputing environments, you might use a loop or gnu parallel. However, we can make slurm perform parallelisation for us with minimal effort. This has been tested on Zeus. The maximum number of jobs that can be created with a single array is 1000. However, the workq partition on Zeus is limited to a max of 512 jobs in the queue, and 16 jobs running concurrently. Therefore, do not create an array that will spawn more than 512 jobs. With the limit on number of concurrent jobs, a max of 16 will run at a time, with a new one spawning as an older one completes.


> ## Use two terminal windows if you can
>
> If you can, open at least two terminal windows, and connect to the VM from both of them.  In this way, you can use one to edit files, and one to execute commands, thus making your workflow more efficient.
{: .callout}



> ## Pull the container images
> 
> To save time, you're not going to search for the images on the online registry.  
> Instead, your first task is to download the following container images.
> 
> **IMPORTANT**: use only these images, as they have been pre-cached in the virtual machine to speed up the pull processes.
> 
> ```source
> quay.io/biocontainers/salmon:1.2.1--hf69c8f4_0
> quay.io/biocontainers/fastqc:0.11.9--0
> quay.io/biocontainers/multiqc:1.9--pyh9f0ad1d_0
> ```
> 
> > ## Solution
> > 
> > ```bash
> > singularity pull docker://quay.io/biocontainers/salmon:1.2.1--hf69c8f4_0
> > singularity pull docker://quay.io/biocontainers/fastqc:0.11.9--0
> > singularity pull docker://quay.io/biocontainers/multiqc:1.9--pyh9f0ad1d_0
> > ```
> {: .solution}
{: .challenge}
