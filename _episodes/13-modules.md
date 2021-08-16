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
> module avail | grep blast+
> ```
> 
> ```output
>    blast+/2.7.1 blast+/2.10.1 #Example output edited for clarity
> ```
> We have two versions to choose from: versions 2.7.1 and 2.10.1, as indicated by the numbers after the slash. Let's choose 2.7.1 for this example. 
> To load a module with a specific version number, use
> ```bash
> module load blast+/2.7.1
> ```
> Then to see what modules you have loaded in your environment, use
> ```bash
> module list
> ```
> ```output
> Currently Loaded Modules:
> 1) pawseytools/1.29   2) slurm/20.02.3   3) gcc/4.8.5   4) sandybridge/1.0   5) lmdb/0.9.21   6) blast+/2.7.1
> ``` 
> You will notice that blast is loaded, but there are some other modules loaded too. These are loaded by default by the Pawsey systems to ensure a smooth user experience.
> To test that the blast+ module is working, let's try a small command to get to the help page
> ```bash
> blastn -h
> ```
> ```output
> USAGE
>  blastn [-h] [-help] [-import_search_strategy filename]
>    [-export_search_strategy filename] [-task task_name] [-db database_name]
>    [-dbsize num_letters] [-gilist filename] [-seqidlist filename]
>    [-negative_gilist filename] [-negative_seqidlist filename]
>    [-entrez_query entrez_query] [-db_soft_mask filtering_algorithm]
>    [-db_hard_mask filtering_algorithm] [-subject subject_input_file]
>    [-subject_loc range] [-query input_file] [-out output_file]
>    [-evalue evalue] [-word_size int_value] [-gapopen open_penalty]
>    [-gapextend extend_penalty] [-perc_identity float_value]
>    [-qcov_hsp_perc float_value] [-max_hsps int_value]
>    [-xdrop_ungap float_value] [-xdrop_gap float_value]
>    [-xdrop_gap_final float_value] [-searchsp int_value]
>    [-sum_stats bool_value] [-penalty penalty] [-reward reward] [-no_greedy]
>    [-min_raw_gapped_score int_value] [-template_type type]
>    [-template_length int_value] [-dust DUST_options]
>    [-filtering_db filtering_database]
>    [-window_masker_taxid window_masker_taxid]
>    [-window_masker_db window_masker_db] [-soft_masking soft_masking]
>    [-ungapped] [-culling_limit int_value] [-best_hit_overhang float_value]
>    [-best_hit_score_edge float_value] [-window_size int_value]
>    [-off_diagonal_range int_value] [-use_index boolean] [-index_name string]
>    [-lcase_masking] [-query_loc range] [-strand strand] [-parse_deflines]
>    [-outfmt format] [-show_gis] [-num_descriptions int_value]
>    [-num_alignments int_value] [-line_length line_length] [-html]
>    [-max_target_seqs num_sequences] [-num_threads int_value] [-remote]
>    [-version]
>
> DESCRIPTION
>   Nucleotide-Nucleotide BLAST 2.7.1+
>
> Use '-help' to print detailed descriptions of command line arguments
> ```
> Ok, if we want to take the blast+ module out of our environment, we can use
> ```bash
> module unload blast+
> # Let's check out list of loaded modules again
> module list
> ```
> ```output
> Currently Loaded Modules:
> 1) pawseytools/1.29   2) slurm/20.02.3   3) gcc/4.8.5   4) sandybridge/1.0   5) lmdb/0.9.21
> ```
{: .challenge}


### What modules are available?

To view all of the available modules use

```bash
module avail
```

```output
# Output has been condensed for clarity

------------------------------------------------- /opt/modulefiles --------------------------------------------------
   slurm/16.05.8    slurm/17.02.9    slurm/17.11.9    slurm/18.08.6    slurm/19.05.5    slurm/20.02.3 (L,D)

------------------------------------------ /pawsey/sles12sp3/modulefiles/apps ---------------------------------------
   comsol/5.5                   ior/3.0.1           (D)    ncl/6.4.0              openfoam/6            paraview-server/5.7.0 (D)
   comsol/5.6            (D)    libgpuarray/0.7.5          nwchem/6.8             openfoam/6.0          paraview-server/5.8.0    
   cpp_hdf5converter/git        mesa/18.3.3                oidn/0.9.0             ospray/1.7.2   (D)    pigz/2.3.4        
   gsl/2.4                      mpifileutils/master        openfoam+/v1712        ospray/1.8.5          plumed2/2.4.2
   ior/LLNL                     mpifileutils/0.8.1  (D)    openfoam/5.0    (D)    packmol/17.333        proj/4.9.3

----------------------------------------- /pawsey/sles12sp3/modulefiles/bio-apps -------------------------------------
   allpathslg/52488        blat/3.6                            exonerate/2.2.0             htslib/1.6             (D)    plink/1.07
   amos/3.1.0              bowtie/1.2.1.1                      fastml/3.1                  igv/2.4.14                    plinkseq/0.10
   bamkit/0.1              bowtie2/2.3.3.1              (D)    fastqc/0.11.4               interproscan/5.27-66.0        probabel/0.5.0
   bamtools/2.4.1          bowtie2/2.3.4.1                     faststructure/1.0           jellyfish/2.2.6               pyrad/3.0.66
   bcftools/1.6            breakdancer/1.1.2_2013_03_08        fastx_toolkit/0.0.14        khmer/2.1.2                   pysam/0.13  
   beagle-lib/2.1.2        bsmap/2.90                          freebayes/0.9.21            lastz/1.04.00                 raxml/8.2.11
   beast/1.8.4             bsseeker2/2.1.3                     gblock/0.91b                libgtextutils/0.7             rsem/1.3.0  
   beast/2.4.7      (D)    bwa/0.7.17                          gcta/1.26.0                 mach/1.0.18                   rsem/1.3.3      (D)
   bedtools/2.26.0         canu/1.6                            geneid/1.4.4                mafft/7.313                   samblaster/0.1.24
   bioperl/1.7.1           cap3/20130608                       glimmer/3.02b               mcl/14-137                    samtools/0.1.19  
   biopython/1.70          cdhit/4.6.8                         glimmerhmm/3.0.4            mrbayes/3.2.6                 samtools/1.6    (D)
   bismark/0.19.0          chunkchromosome/2014-05-27          gmap/2017-11-15             mummer/3.23                   scarpa/0.241           
   blast+/2.7.1            clustalw/2.1                        hmmer/3.0            (D)    muscle/3.8.1551               screed/1.0             
   blast+/2.10.1    (D)    emboss/6.6.0                        hmmer/3.1b2                 ngs/1.3.0                     seqtk-trinity/0.0.2    

--------------------------------------- /pawsey/sles12sp3/modulefiles/devel -----------------------------------------
   ant/1.10.1               cuffs-gpu/0.5.0          geos/3.6.2                                 intel-mpi/2017.0.3          llvm/6.0.0          
   armadillo/8.300.1        curl/7.57.0              glew/2.1.0                                 intel-mpi/2017.0.4   (D)    lmdb/0.9.21         
   autoconf/2.69            dmd/2.077.1              go/1.14.1                                  intel-tbb/2017.0.4          lwgrp/1.0.2         
   automake/1.15            dtcmp/1.0.3              gperftools/2.6.2                           intel/17.0.5         (D)    mbuffer/20171011    
   bazel/0.12.0             dtcmp/1.1.0     (D)      hdf4/4.2.13                                intel/19.0.5                mpibash/1.2   (D)
   boost/1.72.0             eigen/3.2.6     (D)      hdf5/1.10.1                                java/8u151                  mpibash/1.3         
   boost/1.73.0      (D)    eigen/3.3.4              hdf5/1.12.0-parallel-api-v16               knl/1.0                     mvapich/2.3a  (D)
   broadwell/1.0            fftw/3.3.7               hdf5/1.12.0-parallel-api-v110              lapack/3.8.0                mvapich/2.3b        
   bzip2/1.0.6              fltk/1.3.4               hdf5/1.12.0-parallel-api-v112              ldc/1.6.0                   netcdf/4.5.0        
   cairo/1.14.10            forge/18.0.2             hdf5/1.12.0-c++-noparallel-api-v16         libarchive/3.3.1            ninja/1.10.2        
   cfitsio/3.420     (D)    forge/18.1.2    (D)      hdf5/1.12.0-c++-noparallel-api-v110        libarchive/3.3.2     (D)    openmpi/2.1.2       
   cfitsio/3450             forge/19.0.3             hdf5/1.12.0-c++-noparallel-api-v112 (D)    libcircle/0.2.1-rc.1 (D)    pcre/8.41           
   cmake/3.15.0             gcc/4.8.5       (L,D)    intel-daal/2017.0.4                        libcircle/0.2.1             pgi/18.3      (D)
   cmake/3.18.0      (D)    gcc/5.5.0                intel-ipp/2017.0.4                         libconfig/1.7.2             pgi/19.1            
   cpprestsdk/2.10.0        gcc/7.2.0                intel-mkl/2017.0.4                  (D)    libjpeg-turbo/1.5.2         pixman/0.34.0       
   cuda/8.0          (D)    gcc/8.3.0                intel-mkl/2017.0.5                         libsodium/1.0.16            qt/4.8.6
   cuda/10.2                gdrcopy/1.3              intel-mpi/19.0.5                           libxml2/2.9.7               qt/5.9.3      (D)

----------------------------------------- /pawsey/sles12sp3/modulefiles/python -----------------------------------------
   alabaster/0.7.10                     click/6.7                  functools32/3.2.3-2           mercurial/4.4.2             pluggy/0.6.0       
   argparse/1.4.0                       coverage/5.2               future/0.16.0                 mock/2.0.0                  progress/1.3       
   asn1crypto/0.24.0                    cryptography/2.1.4         h5py/2.7.1                    mpi4py/3.0.0                psutil/5.4.3       
   astropy/2.0.2                        cutadapt/1.15              healpy/1.11.0                 netcdf4-python/1.3.1        psycopg2/2.7.3.2   
   attrs/17.3.0                         cycler/0.10.0              idna/2.6                      networkx/2.0                py/1.5.2           
   babel/2.5.1                          cython/0.27.3       (D)    imagesize/0.7.1               ngs-sdk/1.3.0               pyasn1/0.4.2       
   backports.functools_lru_cache/1.4    cython/0.29.21             ipaddress/1.0.19              nose/1.3.7                  pycairo/1.15.4     
   backports_abc/0.5                    d2to1/0.2.12.post1         ipython/5.5.0          (D)    numpy/1.13.3                pycogent/1.9       
   bcrypt/3.1.4                         decorator/4.1.2            ipython/6.2.1                 numpy/1.19.0         (D)    pycparser/2.18     
   biolite/1.0.0                        dendropy/4.3.0             jinja2/2.10                   pandas/0.21.0               pycrypto/2.6.1     
   biom-format/2.1.6                    distribute/0.7.3           jsonschema/3.2.0              paramiko/2.4.0              pyephem/3.7.6.0    
   boto3/1.17.93                        emcee/2.2.1                lmfit/0.9.7                   phonopy/1.12.2.20           pygments/2.2.0     
   bzr/2.7.0                            enum34/1.1.6               mako/1.0.7                    pint/0.8.1                  pynacl/1.2.1       
   certifi/2017.11.5                    ephem/3.7.6.0              markupsafe/1.0                pip/9.0.1            (D)    pynast/1.2.2       
   cffi/1.11.2                          ete3/3.1.1                 matplotlib/2.1.0              pip/19.2.1                  pyparsing/2.2.0    

-------------------------------------- /pawsey/sles12sp3/modulefiles/tools ----------------------------------------------
   aria2/1.33.1                 gnuplot/5.2.2               ncftp/3.2.6              parallel/20191022          pshell/20180919        
   autocutsel/0.10.0            hpn-ssh/7.5p1-14v13         nco/4.7.0                pawseytools/1.27           pshell/20190215        
   bbcp/17.12.00.00.0           imagemagick/7.0.7-35        nextflow/20.04.1         pawseytools/1.28           pshell/20200828 (D)    
   ffmpeg/3.4                   maali/1.7.6                 nextflow/20.07.1  (D)    pawseytools/1.29  (L,D)    rclone/1.55.0          
   globus/6.0            (D)    maali/1.8.4          (D)    parafly/0.1.0            pdsh/2.33                  reframe/2.15           
   globus/6.0.1502136246        nano/2.9.1                  parallel/20171122 (D)    pmount/20190823            reframe/3.4     (D)    

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
> > 1. There are two versions installed, bowtie2/2.3.3.1 and bowtie2/2.3.4.1
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
  --debug=dbglvl                    Program tracing written to stderr
  --pin_versions=pinVersions        When doing a restore use specified version, do not follow defaults
  -d --default                      List default modules only when used with avail
  -q --quiet                        Do not print out warnings
  --expert                          Expert mode
  -t --terse                        Write out in machine readable format for commands: list, avail, spider, savelist
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

module [options] sub-command [args ...]

Help sub-commands:
------------------
  help                              prints this message
  help                module [...]  print help message from module(s)

Loading/Unloading sub-commands:
-------------------------------
  load | add          module [...]  load module(s)
  try-load | try-add  module [...]  Add module(s), do not complain if not found
  del | unload        module [...]  Remove module(s), do not complain if not found
  swap | sw | switch  m1 m2         unload m1 and load m2
  purge                             unload all modules
  refresh                           reload aliases from current list of modules.
  update                            reload all currently loaded modules.

Listing / Searching sub-commands:
---------------------------------
  list                              List loaded modules
  list                s1 s2 ...     List loaded modules that match the pattern
  avail | av                        List available modules
  avail | av          string        List available modules that contain "string".
  spider                            List all possible modules
  spider              module        List all possible version of that module file
  spider              string        List all module that contain the "string".
  spider              name/version  Detailed information about that version of the module.
  whatis              module        Print whatis information about module
  keyword | key       string        Search all name and whatis that contain "string".

Searching with Lmod:
--------------------
  All searching (spider, list, avail, keyword) support regular expressions:


  -r spider           '^p'          Finds all the modules that start with `p' or `P'
  -r spider           mpi           Finds all modules that have "mpi" in their name.
  -r spider           'mpi$         Finds all modules that end with "mpi" in their name.

Handling a collection of modules:
--------------------------------
  save | s                          Save the current list of modules to a user defined "default" collection.
  save | s            name          Save the current list of modules to "name" collection.
  reset                             The same as "restore system"
  restore | r                       Restore modules from the user's "default" or system default.
  restore | r         name          Restore modules from "name" collection.
  restore             system        Restore module state to system defaults.
  savelist                          List of saved collections.
  describe | mcc      name          Describe the contents of a module collection.
  disable             name          Disable a collection.

Deprecated commands:
--------------------
  getdefault          [name]        load name collection of modules or user's "default" if no name given.
                                    ===> Use "restore" instead  <====
  setdefault          [name]        Save current list of modules to name if given, otherwise save as the default list for you the user.
                                    ===> Use "save" instead. <====

Miscellaneous sub-commands:
---------------------------
  show                modulefile    show the commands in the module file.
  use [-a]            path          Prepend or Append path to MODULEPATH.
  unuse               path          remove path from MODULEPATH.
  tablelist                         output list of active modules as a lua table.

Important Environment Variables:
--------------------------------
  LMOD_COLORIZE                     If defined to be "YES" then Lmod prints properties and warning in color.

```
