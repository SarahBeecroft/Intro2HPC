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

Before you start, `cd` into the appropriate directory:

```bash
cd XXXX
```


> ## Search for a BLAST container image in a registry
> 
> Today you're using the web registry **RedHat Quay**, at [https://quay.io](https://quay.io), to search the image we need.  This registry contains all the images provided by the **BioContainers** project, so there are good chances of finding what you need here.  The BioContainers home page, [https://biocontainers.pro](https://biocontainers.pro), also has a search function, however its user interface is a bit less friendly right now.
> 
> Now try and find the *most recent* container image for BLAST by BioContainers, using the Quay web site.
> 
> > ## Solution
> > 
> > * Go to https://quay.io (NO registration required!);
> > * Locate the *EXPLORE* button on the top of the page, click on it, then in the search field type `blast`;
> > * We want an image from `biocontainers`, so look for `biocontainers/blast` and click on it;
> > * Click on the *Tags* icon on the left, and scroll the list of images to look for the highest Blast version, at the time of writing, it's (`2.10.1`; among the multiple tags for this version, identify the most recent one;
> > * At the time of writing, the resulting image tag will be `2.10.1--pl526he19e7b1_2`;
> > * You can click on the *Fetch* icon at the rightmost side of the record, select *Pull by Tag*, and then copy the full image name in your clipboard.
> > * At the time of writing, the full image specification is then `quay.io/biocontainers/blast:2.10.1--pl526he19e7b1_2`.
> {: .solution}
{: .challenge}


> ## IMPORTANT: which image to use for the next steps?
> 
> As we don't continuously update the content of this tutorial, please use the following image for the rest of this BLAST example:
> 
> `quay.io/biocontainers/blast:2.9.0--pl526h3066fca_4`
>
> We've pre-cached this image in the virtual machine for this tutorial, so the following pull process should only take a few seconds.
{: .callout}


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
