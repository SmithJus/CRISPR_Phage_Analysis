#!/bin/bash
MAG=$1
LOCATION=$2
echo ${MAG}
echo ${LOCATION}
cat copy_final_bins.sh
cat copy_final_bins.sub

#Make directory for final_MAGs
mkdir -p ${LOCATION}/results/final_MAGs

cp ${LOCATION}/results/dRep_all_MAGs/dereplicated_genomes/${MAG} ${LOCATION}/results/final_MAGs/.

#sed -e "s|^|cp ${LOCATION}/results/dRep_all_MAGs/dereplicated_genomes|g" ${LOCATION}/results/quality_MAGs/final_bin_set_unique.txt > ${LOCATION}/results/final_MAGs/copy_final_bin_set.sh
#sed -i "s|$| ${LOCATION}/results/final_MAGs/.|g" ${LOCATION}/results/final_bins/copy_final_bin_set.sh
#bash ${LOCATION}/results/final_bins/copy_final_bin_set.sh
