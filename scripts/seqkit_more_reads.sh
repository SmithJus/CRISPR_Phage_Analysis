#!/bin/bash

#cat scripts
READS=$1
LOCATION=$2
echo ${LOCATION}
cat seqkit_more_reads.sh
cat seqkit_more_reads.sub

#source to my conda directory and activate conda environment
source /home/glbrc.org/jusmith/miniconda3/etc/profile.d/conda.sh
conda activate seqkit

mv ${LOCATION}/results/coverm/more_reads_output/${READS}.fastq_coverm.tsv ${LOCATION}/results/coverm/more_reads_output/${READS}_coverm.tsv
#MAIN
seqkit stats ${LOCATION}/qced_reads/EBPR*.fastq -o ${LOCATION}/results/seqkit/more_reads_output.tsv -T

#deactivate conda env
conda deactivate
