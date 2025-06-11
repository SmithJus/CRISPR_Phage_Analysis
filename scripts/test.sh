#!/bin/bash
#READS=$1
LOCATION=$1
echo ${LOCATION}
#echo ${READS}
cat coverm_more_reads.sh
cat coverm_more_reads.sub

#source to my conda directory and activate conda env
source /home/glbrc.org/jusmith/miniconda3/etc/profile.d/conda.sh
conda activate coverm-0.7

#unzip the reads if needed
#gunzip -c ${LOCATION}/qced_reads/${READS}.gz > ${LOCATION}/qced_reads/${READS} \
#going to output trimmed_mean for every bin in every sample in separate TSV's
coverm genome \
	--genome-fasta-files \
	${LOCATION}/results/global_MAGs/phosphatis_MAG.fasta ${LOCATION}/results/global_MAGs/regalis_MAG.fasta \
        ${LOCATION}/results/global_MAGs/EPV1_MAG.fasta ${LOCATION}/results/global_MAGs/TKFM_MAG.fasta \
	--interleaved ${LOCATION}/qced_reads/EBPRR120100312.fastq  \
	--methods trimmed_mean \
	--threads $2 \
	--min-read-percent-identity 95 \
	--min-covered-fraction 0 \
	-o ${LOCATION}/results/coverm/more_reads_output/test_output.tsv

#deactivate conda env
conda deactivate
