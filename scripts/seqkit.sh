#!/bin/bash

#cat scripts
LOCATION=$1
echo ${LOCATION}
cat seqkit.sh
cat seqkit.sub

#source to my conda directory and activate conda environment
source /home/glbrc.org/jusmith/miniconda3/etc/profile.d/conda.sh
conda activate seqkit

#MAIN
seqkit stats ${LOCATION}/qced_reads/*.fastq -o ${LOCATION}/results/seqkit/output.tsv -T

#deactivate conda env
conda deactivate
