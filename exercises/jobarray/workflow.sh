#!/bin/bash
DOWNLOAD=$(sbatch download.sl | cut -f 4 -d' ')
echo $DOWNLOAD submitted
MAKEDB=$(sbatch -d afterok:$DOWNLOAD makedb.sl | cut -f 4 -d' ')
echo $MAKEDB submitted
BLASTARRAY=$(sbatch -d afterok:$MAKEDB blastarray.sl | cut -f 4 -d' ')
echo $BLASTARRAY submitted
