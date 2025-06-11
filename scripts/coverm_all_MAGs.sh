#!/bin/bash
BIN=$1
LOCATION=$2
echo ${LOCATION}
echo ${BIN}
cat coverm_all_MAGs.sh
cat coverm_all_MAGs.sub

#source to my conda directory and activate conda env
source /home/glbrc.org/jusmith/miniconda3/etc/profile.d/conda.sh
conda activate coverm-0.7

#cp /home/glbrc.org/jusmith/CRISPR_Phage_Analysis/results/SPAdes/assemblies_${SAMPLE}/contigs.fasta /home/glbrc.org/jusmith/CRISPR_Phage_Analysis/results/coverm/read_files/assembly_${SAMPLE}.fasta
#coverM
#cp /home/glbrc.org/jusmith/CRISPR_Phage_Analysis/qced_reads/*.qced.fastq /home/glbrc.org/jusmith/CRISPR_Phage_Analysis/results/coverm/qced_read_files/


#going to output trimmed_mean for every bin in every sample in separate TSV's
coverm genome \
	--genome-fasta-files \
	${LOCATION}/results/renamed_refined_MAGs/* \
	--interleaved ${LOCATION}/qced_reads/*.qced.fastq \
	--methods trimmed_mean \
	--threads $3 \
	--min-read-percent-identity 95 \
	--min-covered-fraction 0 \
	-o ${LOCATION}/results/coverm/allMAG_output_coverm.tsv

#deactivate conda env
conda deactivate
