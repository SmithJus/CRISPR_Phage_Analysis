#!/bin/bash
SAMPLE=$1
LOCATION=$2
echo ${SAMPLE}
echo ${LOCATION}
cat dRep_all_MAGs.sh
cat dRep_all_MAGs.sub

#source to my conda directory
source /home/glbrc.org/jusmith/miniconda3/etc/profile.d/conda.sh
conda activate dRep

#Previous -g that worked: -g ${LOCATION}/results/refined_bins_renamed/${SAMPLE}/renamed_refined_MAGs/*.fasta
#Dereplicate the bins as to not have repetitive genomes
mkdir -p ${LOCATION}/results/dRep_all_MAGs/

dRep dereplicate \
${LOCATION}/results/dRep_all_MAGs/ \
-g ${LOCATION}/results/renamed_refined_MAGs/* \
-comp 50 \
-sa 0.99 \
-nc 0.1 \
--genomeInfo ${LOCATION}/results/checkm_revised_summaries/quality_summaries.csv \
--checkM_method lineage_wf \
--S_algorithm skani \
-d

conda deactivate
