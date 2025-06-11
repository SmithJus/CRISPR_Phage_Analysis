#!/bin/bash
#SAMPLE=$1
LOCATION=$1
#echo ${SAMPLE}
echo ${LOCATION}
cat dRep_test.sh
cat dRep_test.sub

#source to my conda directory 
source /home/glbrc.org/jusmith/miniconda3/etc/profile.d/conda.sh
#source /opt/bifxapps/miniconda3/etc/profile.d/conda.sh
#conda activate /opt/bifxapps/miniconda3/envs/metawrap
conda activate dRep

#Dereplicate the bins as to not have repetitive genomes
dRep dereplicate \
${LOCATION}/results/dRep/test_folder_$(cluster)/ \
-g ${LOCATION}/results/refined_bins_renamed/2005-06-14-EBPR/renamed_refined_MAGs/*.fasta \
-comp 50 \
-sa 0.99 \
-nc 0.1 \
--genomeInfo ${LOCATION}/results/checkm_for_dRep/2005-06-14-EBPR/quality_summary_awk.csv \
--checkM_method lineage_wf \
--S_algorithm skani \
-d

conda deactivate
