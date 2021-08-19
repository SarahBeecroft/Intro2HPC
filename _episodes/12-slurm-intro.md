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
workq*    up    1-8      1-00:00:00     28 2:14:1      29 mixed      z[043-045,047-048,051,053,055-058,060,091-092,094-100,109-110,115-116,122-125]
workq*    up    1-8      1-00:00:00     28 2:14:1      55 allocated  z[046,049-050,052,054,059,061-090,093,101-108,111-114,117-121,126]
longq     up    1        4-00:00:00     28 2:14:1       4 mixed      z[122-125]
longq     up    1        4-00:00:00     28 2:14:1       4 allocated  z[119-121,126]
debugq    up    1-4         1:00:00     28 2:14:1       4 idle       z[127-130]
highmemq  up    1-4      4-00:00:00     16  2:8:1       1 allocated  z135
highmemq  up    1-4      4-00:00:00     16  2:8:1       5 idle       z[136-140]
copyq     up    1-infini 2-00:00:00     32 2:16:1       1 down*      hpc-data7
copyq     up    1-infini 2-00:00:00     32 2:16:1       6 idle       hpc-data[1-6]
copyq     up    1-infini 2-00:00:00     32 2:16:1       1 down       hpc-data8
```

### Using squeue to check running jobs
To see what jobs are already running in the local cluster
```bash
squeue
```

```output
JOBID    USER     ACCOUNT     PARTITION            NAME EXEC_HOST ST     REASON   START_TIME     END_TIME  TIME_LEFT NODES   PRIORITY
5118662  datamonk pawsey0001  copyq      "blast_updated hpc-data4 PD  BeginTime  1 Sep 01:00  1 Sep 07:00    6:00:00     1      75124
5134303  jpeterei pawsey0149  workq        reminder_bot       n/a PD  BeginTime    Mon 10:26    Mon 10:56      30:00     1      75026
5134852  kross    pawsey0272  copyq      manta_121_xtra       n/a PD ReqNodeNot    Sat 08:00    Mon 08:00 2-00:00:00     1      75167
5136035  ggrover  mwavcs      copyq      nf-volt_downlo       n/a PD ReqNodeNot    Sat 08:00    Sat 12:42    4:42:00     1      75653
5136036  ggrover  mwavcs      copyq      nf-volt_downlo       n/a PD ReqNodeNot    Sat 08:00    Sat 12:42    4:42:00     1      75652
5136039  ggrover  mwavcs      copyq      nf-volt_downlo       n/a PD ReqNodeNot    Sat 08:00    Sat 12:42    4:42:00     1      75652
5136062  nswainst mwavcs      copyq      nf-volt_downlo       n/a PD ReqNodeNot    Sat 08:00    Sat 12:42    4:42:00     1      75638
```
**EXEC_HOST** refers to the node which is running the job.  
**ST** refers to the state of the job. 'PD' means pending, 'R' means running.  
**REASON** refers to why the job is not running. **ReqNodeNot** = nodes are not available, **Priority** = a higher priority job exists, **Resources** = waiting on the necessary resources.  

To refine the listing to just jobs from a certain partition, use the `-p` flag
```bash
squeue -p workq
```
```output
JOBID    USER     ACCOUNT     PARTITION            NAME EXEC_HOST ST     REASON   START_TIME     END_TIME  TIME_LEFT NODES   PRIORITY
5134303  jpeterei pawsey0149  workq        reminder_bot       n/a PD  BeginTime    Mon 10:26    Mon 10:56      30:00     1      75026
5136069  qguan    pawsey0168  workq                 vmd       n/a PD Nodes requ          N/A          N/A      30:00     1      75635
5134302  asim     pawsey0142  workq                 goo       n/a PD ReqNodeNot          N/A          N/A 1-00:00:00     1      75225
5134322  asim     pawsey0142  workq                  go       n/a PD ReqNodeNot          N/A          N/A 1-00:00:00     1      75224
5136076  betschma pawsey0379  workq      ace_1000C_50kb       n/a PD ReqNodeNot          N/A          N/A   23:30:00     1      75215
5135685  asim     pawsey0142  workq                  to       n/a PD ReqNodeNot          N/A          N/A 1-00:00:00     1      75210
5136068  lenhan   dv1         workq           Zues-2.sh       n/a PD ReqNodeNot          N/A          N/A    1:00:00     1      75172
```

To refine the listing to a certain user (usually yourself), use the `-u` flag
```bash
squeue -u username
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
> squeue -u username
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
> scancel -u username
> ```
{: .challenge}

### Understanding how to allocate resources to a job
This was touched on in the lecture component of today, but let's revisit by taking a closer look at the `test.sh` script we just ran. 
```bash
cat test.sh
```

```output
#!/bin/bash -l
#SBATCH --reservation=UWAHPC
#SBATCH --account=courses01
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=100M
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
The total number of required CPUs (cores) is then `ntasks-per-node*cpus-per-task`; on Zeus the max is 28.
The `--mem-per-cpu` flag specifies how much memory to use per CPU (core). On Zeus the max is 4GB, but for this job it's set very low.  
The `--time` flag sets the maximum allowable time for your job to run (i.e. the wall-clock limit). This job is set to get cut-off by SLURM at the 5 minute mark.  

