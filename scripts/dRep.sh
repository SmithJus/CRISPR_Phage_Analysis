#!/bin/bash
SAMPLE=$1
LOCATION=$2
echo ${SAMPLE}
echo ${LOCATION}
cat dRep.sh
cat dRep.sub

#source to my conda directory 
source /home/glbrc.org/jusmith/miniconda3/etc/profile.d/conda.sh
#source /opt/bifxapps/miniconda3/etc/profile.d/conda.sh
#conda activate /opt/bifxapps/miniconda3/envs/metawrap
conda activate dRep

#Previous -g that worked: -g ${LOCATION}/results/refined_bins_renamed/${SAMPLE}/renamed_refined_MAGs/*.fasta
#Dereplicate the bins as to not have repetitive genomes
dRep dereplicate \
${LOCATION}/results/dRep2/ \
-g ${LOCATION}/results/renamed_refined_MAGs/* \
-comp 50 \
-sa 0.99 \
-nc 0.1 \
--genomeInfo ${LOCATION}/results/checkm_for_dRep/${SAMPLE}/quality_summary_awk.csv \
--checkM_method lineage_wf \
--S_algorithm skani \
-d

conda deactivate
