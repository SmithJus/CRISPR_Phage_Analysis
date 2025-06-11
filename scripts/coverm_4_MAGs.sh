#!/bin/bash
LOCATION=$1
#SAMPLE=$1
echo ${LOCATION}
#echo ${SAMPLE}
cat coverm_4_MAGs.sh
cat coverm_4_MAGs.sub

#source to my conda directory and activate conda env
source /home/glbrc.org/jusmith/miniconda3/etc/profile.d/conda.sh
conda activate coverm-0.7

#change ".qced.fastq" to ".fastq"
#mv ${LOCATION}/qced_reads/${SAMPLE}.qced.fastq ${LOCATION}/qced_reads/${SAMPLE}.fastq

#going to output trimmed_mean for every bin in every sample in separate TSV's
coverm genome \
	--genome-fasta-files \
	${LOCATION}/results/global_MAGs/phosphatis_MAG.fasta ${LOCATION}/results/global_MAGs/regalis_MAG.fasta \
	${LOCATION}/results/global_MAGs/EPV1_MAG.fasta ${LOCATION}/results/global_MAGs/TKFM_MAG.fasta \
	--interleaved ${LOCATION}/qced_reads/*.fastq \
	--methods trimmed_mean \
	--threads $2 \
	--min-read-percent-identity 95 \
	--min-covered-fraction 0 \
	-o ${LOCATION}/results/coverm/output_coverm.tsv

#deactivate conda env
conda deactivate
