#!/bin/bash
SAMPLE=$1
LOCATION=$2
echo ${SAMPLE}
echo ${LOCATION}
cat edit_checkm_file.sh
cat edit_checkm_file.sub

mkdir -p ${LOCATION}/results/checkm_for_dRep/${SAMPLE}/
cp ${LOCATION}/results/checkm/${SAMPLE}/quality_summary.tsv ${LOCATION}/results/checkm_for_dRep/${SAMPLE}/quality_summary.csv
sed -i 's|Bin Id|genome|g' ${LOCATION}/results/checkm_for_dRep/${SAMPLE}/quality_summary.csv
sed -i 's|Completeness|completeness|g' ${LOCATION}/results/checkm_for_dRep/${SAMPLE}/quality_summary.csv
sed -i 's|Contamination|contamination|g' ${LOCATION}/results/checkm_for_dRep/${SAMPLE}/quality_summary.csv
sed -i 's|\t|,|g' ${LOCATION}/results/checkm_for_dRep/${SAMPLE}/quality_summary.csv

#add the file extension to the first MAG names in the first column.
awk -v OFS="," -F "," '$1=$1".fasta"' ${LOCATION}/results/checkm_for_dRep/${SAMPLE}/quality_summary.csv > ${LOCATION}/results/checkm_for_dRep/${SAMPLE}/quality_summary_awk.csv
sed -i 's|genome.fasta|genome|g' ${LOCATION}/results/checkm_for_dRep/${SAMPLE}/quality_summary_awk.csv

