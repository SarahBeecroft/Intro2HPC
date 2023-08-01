---
title: "Using Modules"
teaching: 5
exercises: 20
questions:
objectives:
- Explain what modules are
- List, load, unload modules
keypoints:
- Modules are a common way of managing software on HPC
- Make sure to load necessary modules in your job scripts 
---
## What are modules
The supercomputing admin staff make available many popular packages, so that users don't need to locally install common software. This is an efficient use of resources and time. Learning how to use modules is essential for getting the most out of HPC resources. 

> ## A worked example
> For example, let's say that you want to use BLAST+. Rather than having to find out how to locally install the software, you could check to see if BLAST+ is supported as a module. Let's check! 
> ```bash
> module avail blast
> ```
> 
> ```output
> ----- /software/setonix/current/containers/views/modules -----
>   blast/2.12.0--pl5262h3289130_0
>
> Use "module spider" to find all possible modules and extensions.
> Use "module keyword key1 key2 ..." to search for all possible modules matching any of the "keys".
>
> ```
> We have two versions to choose from: versions 2.7.1 and 2.10.1, as indicated by the numbers after the slash. Let's choose 2.7.1 for this example. 
> To load a module with a specific version number, use
> ```bash
> module load blast/2.12.0--pl5262h3289130_0 
> ```
> Then to see what modules you have loaded in your environment, use
> ```bash
> module list
> ```
> 
> ```output
> Currently Loaded Modules:
>
> Currently Loaded Modules:
>  1) craype-x86-milan     3) craype-network-ofi       5) xpmem/2.4.4-2.3_13.8__gff0e1d9.shasta   7) gcc/12.1.0      9) cray-dsmml/0.2.2   11) cray-libsci/22.08.1.1 13) pawsey       15) slurm/22.05.2            17) blast/2.12.0--pl5262h3289130_
>  2) libfabric/1.15.0.0   4) perftools-base/22.09.0   6) pawseyenv                               8) craype/2.7.17  10) cray-mpich/8.1.19  12) PrgEnv-gnu/8.3.3 14) pawseytools  16) singularity/3.8.6-nompi
> ```
> 
> You will notice that blast is loaded, but there are some other modules loaded too. These are loaded by default on Pawsey systems to ensure a smooth user experience.
> To test that the blast+ module is working, let's try a small command to get to the help page
> ```bash
> blastn -h
> ```
> 
> ```output
> USAGE
> blastn [-h] [-help] [-import_search_strategy filename]
>    [-export_search_strategy filename] [-task task_name] [-db database_name]
>    [-dbsize num_letters] [-gilist filename] [-seqidlist filename]
>    [-negative_gilist filename] [-negative_seqidlist filename]
>    [-taxids taxids] [-negative_taxids taxids] [-taxidlist filename]
>    [-negative_taxidlist filename] [-entrez_query entrez_query]
>    [-db_soft_mask filtering_algorithm] [-db_hard_mask filtering_algorithm]
>    [-subject subject_input_file] [-subject_loc range] [-query input_file]
>    [-out output_file] [-evalue evalue] [-word_size int_value]
>    [-gapopen open_penalty] [-gapextend extend_penalty]
>    [-perc_identity float_value] [-qcov_hsp_perc float_value]
>    [-max_hsps int_value] [-xdrop_ungap float_value] [-xdrop_gap float_value]
>   [-xdrop_gap_final float_value] [-searchsp int_value]
>    [-sum_stats bool_value] [-penalty penalty] [-reward reward] [-no_greedy]
>    [-min_raw_gapped_score int_value] [-template_type type]
>    [-template_length int_value] [-dust DUST_options]
>    [-filtering_db filtering_database]
>    [-window_masker_taxid window_masker_taxid]
>    [-window_masker_db window_masker_db] [-soft_masking soft_masking]
>    [-ungapped] [-culling_limit int_value] [-best_hit_overhang float_value]
>    [-best_hit_score_edge float_value] [-subject_besthit]
>    [-window_size int_value] [-off_diagonal_range int_value]
>    [-use_index boolean] [-index_name string] [-lcase_masking]
>    [-query_loc range] [-strand strand] [-parse_deflines] [-outfmt format]
>    [-show_gis] [-num_descriptions int_value] [-num_alignments int_value]
>    [-line_length line_length] [-html] [-sorthits sort_hits]
>    [-sorthsps sort_hsps] [-max_target_seqs num_sequences]
>    [-num_threads int_value] [-mt_mode int_value] [-remote] [-version]
>
> DESCRIPTION
>   Nucleotide-Nucleotide BLAST 2.12.0+
>
>Use '-help' to print detailed descriptions of command line arguments
> ```
> Ok, if we want to take the blast+ module out of our environment, we can use
> ```bash
> module unload blast
> # Let's check out list of loaded modules again
> module list
> ```
> 
> ```output
> Currently Loaded Modules:
>
> Currently Loaded Modules:
>  1) craype-x86-milan     3) craype-network-ofi       5) xpmem/2.4.4-2.3_13.8__gff0e1d9.shasta   7) gcc/12.1.0      9) cray-dsmml/0.2.2   11) cray-libsci/22.08.1.1 13) pawsey       15) slurm/22.05.2
>  2) libfabric/1.15.0.0   4) perftools-base/22.09.0   6) pawseyenv                               8) craype/2.7.17  10) cray-mpich/8.1.19  12) PrgEnv-gnu/8.3.3 14) pawseytools  16) singularity/3.8.6-nompi
> ```
{: .challenge}


### What modules are available?

To view all of the available modules use

```bash
module avail
# press q to exit the avail screen
```

```output
# Output has been condensed for clarity

---------------------------------------------------------------------------------------------- /opt/cray/pe/lmod/modulefiles/mpi/gnu/8.0/ofi/1.0/cray-mpich/8.0 ----------------------------------------------------------------------------------------------
   cray-hdf5-parallel/1.12.2.1      craype-dl-plugin-ftr/22.06.1.2    craype-dl-plugin-py3/21.04.1      craype-dl-plugin-py3/22.08.1
   cray-parallel-netcdf/1.12.3.1    craype-dl-plugin-py3/21.02.1.3    craype-dl-plugin-py3/22.06.1.2    craype-dl-plugin-py3/22.09.1 (D)

------------------------------------------------------------------------------------------ /software/projects/pawsey0001/sbeecroft/setonix/modules/zen3/gcc/12.1.0 -------------------------------------------------------------------------------------------
   awscli/1.16.308-lsytfn3        py-botocore/1.13.44-4akvtdz    py-jmespath/0.10.0-edb6pk7    py-pyasn1/0.4.6-cz4oyjo             py-pyyaml/5.1.2-suqjcx3        py-setuptools-scm/6.3.2-ladffju    py-tomli/1.2.1-nd3pse5
   cmaq/5.3.1-ufxlpng             py-colorama/0.4.1-cqaqozz      py-packaging/21.0-ctswzg7     py-pyparsing/2.4.7-xyospqf          py-rsa/3.4.2-442zd47           py-setuptools/57.4.0-gai6cpk       py-urllib3/1.25.6-3kpilb4
   fastqc/0.11.9-3xczk4r   (D)    py-docutils/0.15.2-pskxmp2     py-pip/22.2.2-xhs7glf         py-python-dateutil/2.8.2-3x7ykix    py-s3transfer/0.2.1-vjwvdqz    py-six/1.16.0-vu2pa5f              python/3.9.9-iylvmfy

  Where:
   D:  Default Module
   L:  Module is loaded

```

> ## Questions
> 1. How many versions of Bowtie2 are installed, and what are the version numbers?
> 
> 2. Some modules have a (D) or (L) next to them. What does the (D) or (L) mean?
> 
> > ## Solutions
> > 1. There is one version installed, bowtie2/2.4.5--py36hd4290be_0. Find this out with `module avail bowtie`
> > 
> > 2. The (D) indicates the default version of the module that will be loaded if a specific version isn't specified by the user. The (L) indicates modules that are currently loaded. 
> {: .solution} 
{: .challenge} 

## Getting help
To get a list of all the commands available with the `module` software, use the help function as below
```bash
module help
```

```output
Usage: module [options] sub-command [args ...]

Options:
  -h -? -H --help                   This help message
  -s availStyle --style=availStyle  Site controlled avail style: system (default: system)
  --regression_testing              Lmod regression testing
  -D                                Program tracing written to stderr
  --debug=dbglvl                    Program tracing written to stderr (where dbglvl is a number
                                    1,2,3)
  --pin_versions=pinVersions        When doing a restore use specified version, do not follow
                                    defaults
  -d --default                      List default modules only when used with avail
  -q --quiet                        Do not print out warnings
  --expert                          Expert mode
  -t --terse                        Write out in machine readable format for commands: list, avail,
                                    spider, savelist
  --initial_load                    loading Lmod for first time in a user shell
  --latest                          Load latest (ignore default)
  --ignore_cache                    Treat the cache file(s) as out-of-date
  --novice                          Turn off expert and quiet flag
  --raw                             Print modulefile in raw output when used with show
  -w twidth --width=twidth          Use this as max term width
  -v --version                      Print version info and quit
  -r --regexp                       use regular expression match
  --gitversion                      Dump git version in a machine readable way and quit
  --dumpversion                     Dump version in a machine readable way and quit
  --check_syntax --checkSyntax      Checking module command syntax: do not load
  --config                          Report Lmod Configuration
  --config_json                     Report Lmod Configuration in json format
  --mt                              Report Module Table State
  --timer                           report run times
  --force                           force removal of a sticky module or save an empty collection
  --redirect                        Send the output of list, avail, spider to stdout (not stderr)
  --no_redirect                     Force output of list, avail and spider to stderr
  --show_hidden                     Avail and spider will report hidden modules
  --spider_timeout=timeout          a timeout for spider
  -T --trace                        

[...]

```
