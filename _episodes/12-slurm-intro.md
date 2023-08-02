---
title: "Basics of Interacting with SLURM Scheduler"
teaching: 5
exercises: 20
questions:
objectives:
- Query the SLURM job queue
- Submit a job to the queue
- Cancel a submitted job
keypoints:
- SLURM manages the allocation and resourcing of all submitted jobs
- Being able to check the status of your job is useful
---

### Using sinfo to see what resources are available
To view the state of the available nodes (organised in partitions)
```bash
sinfo
```

```output
PARTITION AVAIL JOB_SIZE  TIMELIMIT   CPUS  S:C:T   NODES STATE      NODELIST
work*     up    1-infini 1-00:00:00    256 2:64:2       3 planned    nid[001137,001401-001402]
work*     up    1-infini 1-00:00:00    256 2:64:2      38 down$      nid[001011,001046,001071,001086,001104-001111,001126,001135,001187,001190,001243,001273,001282-001283,001303,001307,001420,001563,001689,002038,002049,002304,002321,002348,002442,002562,002564-002567,002585,002805]
work*     up    1-infini 1-00:00:00    256 2:64:2       5 completing nid[001017,001036,001227,001412,002818]
work*     up    1-infini 1-00:00:00    256 2:64:2       3 down*      nid[001338-001339,002433]
work*     up    1-infini 1-00:00:00    256 2:64:2       1 completing nid002312
work*     up    1-infini 1-00:00:00    256 2:64:2       9 drained    nid[001146-001147,001152-001155,001159,001204,001512]
long      up    1        4-00:00:00    256 2:64:2       2 mixed      nid[002596,002603]
long      up    1        4-00:00:00    256 2:64:2       6 allocated  nid[002597-002602]
copy      up    1-infini 2-00:00:00     64 1:32:2       3 mixed      setonix-dm[01-03]
copy      up    1-infini 2-00:00:00     64 1:32:2       1 down       setonix-dm04
askaprt   up    1-infini 1-00:00:00    256 2:64:2       9 down$      nid[001803,001854,001869,001885,001973,001986-001987,002641,002643]
askaprt   up    1-infini 1-00:00:00    256 2:64:2       2 mixed$     nid[001768,001831]
askaprt   up    1-infini 1-00:00:00    256 2:64:2       1 completing nid002751
askaprt   up    1-infini 1-00:00:00    256 2:64:2       1 reserved   nid002636
askaprt   up    1-infini 1-00:00:00    256 2:64:2      11 mixed      nid[002615-002616,002619,002621,002625,002628-002629,002633,002635,002644,002675]
debug     up    1-4         1:00:00    256 2:64:2       8 maint      nid[002604-002611]
highmem   up    1        4-00:00:00    256 2:64:2       1 mixed      nid001505
highmem   up    1        4-00:00:00    256 2:64:2       6 allocated  nid[001504,001506-001509,001511]
highmem   up    1        4-00:00:00    256 2:64:2       1 idle       nid001510
gpu       up    1-infini 1-00:00:00    128  8:8:2       5 maint      nid[002836,002856,002864,002866,002882]
gpu       up    1-infini 1-00:00:00    128  8:8:2       1 down*      nid002834
gpu       up    1-infini 1-00:00:00    128  8:8:2       2 idle       nid[002932,002938]
gpu-dev   up    1-infini    4:00:00    128  8:8:2       4 down$      nid[002944,002946,003008,003010]
gpu-dev   up    1-infini    4:00:00    128  8:8:2      16 idle       nid[002948,002950,002984,002986,002988,002990,002992,002994,002996,002998,003000,003002,003004,003006,003012,003014]
gpu-highm up    1-infini 1-00:00:00    128  8:8:2       4 down$      nid[002888,002908,002968,002976]
gpu-highm up    1-infini 1-00:00:00    128  8:8:2       6 maint      nid[002890,002900,002902,002910,002970,002978]
gpu-highm up    1-infini 1-00:00:00    128  8:8:2       5 mixed      nid[002956,002958,002962,002964,002966]
casda     up    1-infini 1-00:00:00     64 1:32:2       1 idle       casda-an01
```


### Using squeue to check running jobs
To see what jobs are already running in the local cluster
```bash
squeue
```

```output
 JOBID  PARTITION     USER ACCOUNT                    NAME  ST REASON    START_TIME                TIME  TIME_LEFT NODES CPUS PRIORITY NODELIST
363117       long      *** pawsey0399      str_detect_chr3   R None      09:07:19               9:30:05 3-14:29:55     1   34 90037 nid002596
363117       long      *** pawsey0399           str_detect   R None      09:07:19               9:30:05 3-14:29:55     1   34 90037 nid002596
356825       long   ****** d71              70_update_long   R None      08:29:18              10:08:07 3-13:51:53     1  256 120309 nid002597
348465       long  ******* pawsey0386         M2s60TD_smLO   R None      08:29:18              10:08:07 3-13:51:53     1  256 90579 nid002601
362041    highmem   ****** pawsey0263      asm_Hexaprotodo   R None      05:38:49              12:58:36 3-11:01:24     1  128 75289 nid001505
347976       long ******** pawsey0106         Coupling_eta   R None      08:29:18              10:08:07 2-13:51:53     1   48 120819 nid002596
```
**EXEC_HOST** refers to the node which is running the job.  
**ST** refers to the state of the job. 'PD' means pending, 'R' means running.  
**REASON** refers to why the job is not running. **ReqNodeNot** = nodes are not available, **Priority** = a higher priority job exists, **Resources** = waiting on the necessary resources.  

To refine the listing to just jobs from a certain partition, use the `-p` flag
```bash
squeue -p work
```
```output
 JOBID  PARTITION     USER ACCOUNT                    NAME  ST REASON    START_TIME                TIME  TIME_LEFT NODES CPUS PRIORITY NODELIST
357595       work     **** pawsey0380      S13_RA110_S320_   R None      18:39:15                  0:23   23:59:37     1  256 75282 nid001568
363718       work   ****** pawsey0382               lammps   R None      18:37:14                  2:24   23:57:36     1  128 75119 nid001608
363718       work   ****** pawsey0382               lammps   R None      18:35:42                  3:56   23:56:04     1  128 75119 nid001137
357595       work     **** pawsey0380      S13_RA110_S320_   R None      18:35:08                  4:30   23:55:30     1  256 75282 nid002352
363718       work   ****** pawsey0382               lammps   R None      18:30:34                  9:04   23:50:56     1  128 75118 nid001200
357595       work     **** pawsey0380      S13_RA110_S320_   R None      18:28:35                 11:03   23:48:57     1  256 75281 nid001398
363826       work      *** m49                  CuO-111-Vo   R None      18:22:22                 17:16   23:42:44     1  144 75054 nid001516

```

To refine the listing to a certain user (usually yourself), use the `-u` flag
```bash
squeue -u $USER
```

> ## Submitting a job to the queue using sbatch
> ```bash
> sbatch test.sh
> ```
>
> Each job gets a unique identifier (Job ID)
>
> Can you see your job running in the queue? What is the jod ID?
> ```bash
> squeue -u $USER
> ```
>
> ## Cancelling a submitted job using scancel
> Sometimes you will want to cancel a job. Maybe you were just testing the script, or maybe you realised you made a mistake! 
>
> To cancel your specific job
> ```bash
> scancel jobID
> ```
>
> You can also cancel all jobs under your name with 
> ```bash
> scancel -u $USER
> ```
{: .challenge}

### Understanding how to allocate resources to a job
This was touched on in the lecture component of today, but let's revisit by taking a closer look at the `test.sh` script we just ran. 
```bash
cat test.sh
```

```output
#!/bin/bash -l
#SBATCH --reservation=UWATraining
#SBATCH --account=courses01
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=100M
#SBATCH --time=00:05:00
#SBATCH --export=NONE

echo 'I am a test job'
echo 'sleeping for 5 minutes'
sleep 5m
```

The `#SBATCH` lines specify to SLURM the computational resources/specifications we want for our job. It is also important to note that SLURM job scripts start with `#!/bin/bash` because they are essentially bash scripts.  
The `--reservation` flag specifies that we will use the special reservation for this training session. You wouldn't need to specify that typically.  
The `--account` flag tells the system which allocation to 'charge' for the compute time.  
The `--nodes` flag specifies how many nodes you want to use.  
The `--ntasks-per-node` flag specifies how many tasks per node you want to run.  
The `--cpus-per-task` flag specifies how many CPUs (cores) per task you need. 
The `--mem` flag specifies how much memory to use per job.
The `--time` flag sets the maximum allowable time for your job to run (i.e. the wall-clock limit). This job is set to get cut-off by SLURM at the 5 minute mark.  

