#!/bin/bash
SAMPLE=$1
LOCATION=$2
echo ${SAMPLE}
echo ${LOCATION}
cat checkM.sh
cat checkM.sub

#source to my conda directory 
source /home/glbrc.org/jusmith/miniconda3/etc/profile.d/conda.sh
#source /opt/bifxapps/miniconda3/etc/profile.d/conda.sh
#conda activate /opt/bifxapps/miniconda3/envs/metawrap
conda activate checkM

checkm lineage_wf \
-x "fasta" \
-t $3 \
--tab_table \
-f ${LOCATION}/results/checkm/${SAMPLE}/quality_summary.tsv \
--tmpdir ${LOCATION}/dump \
${LOCATION}/results/refined_bins_renamed/${SAMPLE}/renamed_refined_MAGs/ \
${LOCATION}/results/checkm/${SAMPLE}/

conda deactivate
