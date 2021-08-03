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
**EXEC_HOST** refers to the node which is running the job
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

To refine the listing to a certain user (usually yourself), use the -u flag
```bash
squeue -u username
```

### Submitting a job to the queue using sbatch
```bash
sbatch test_job.sh
```

Each job gets a unique identifier (Job ID)

Can you see your job running in the queue? What is the jod ID?
```bash
squeue -u username
```

### Cancelling a submitted job using scancel
Sometimes you will want to cancel a job. Maybe you were just testing the script, or maybe you realised you made a mistake! 

To cancel your specific job
```bash
scancel jobID
```

You can also cancel all jobs under your name with 
```bash
scancel -u username
```
