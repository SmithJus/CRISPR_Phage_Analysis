#!/bin/bash
SAMPLE=$1
LOCATION=$2
echo ${SAMPLE}
echo ${LOCATION}
cat select_bins.sh
cat select_bins.sub

#make directory for quality MAGs
mkdir -p ${LOCATION}/results/quality_MAGs

#note that there are a different number of genomes listed in genomeInfo than contained in dereplicated_genomes
#highlight medium quality bins (completeness >= 50 and contamination < 10) in a separate text doc
awk -F "," '{{ if(($12 >= 50) && ($13 < 10)) {{print}} }}' ${LOCATION}/results/dRep_all_MAGs/data_tables/genomeInfo.csv | cut -d "," -f 1 > ${LOCATION}/results/quality_MAGs/medium_quality_bins.txt

#highlight high quality bins (completeness > 90 and contamination < 5) in a separate text doc
awk -F "," '{{ if(($12 > 90) && ($13 < 5)) {{print}} }}' ${LOCATION}/results/dRep_all_MAGs/data_tables/genomeInfo.csv | cut -d "," -f 1 > ${LOCATION}/results/quality_MAGs/high_quality_bins.txt

#concatenate the high and medium quality bin text documents
cat ${LOCATION}/results/quality_MAGs/medium_quality_bins.txt ${LOCATION}/results/quality_MAGs/high_quality_bins.txt > ${LOCATION}/results/quality_MAGs/final_bin_set.txt

#remove duplicate lines by using sort and uniq into a new text doc, final_bin_set_unique.txt
sort ${LOCATION}/results/quality_MAGs/final_bin_set.txt | uniq > ${LOCATION}/results/quality_MAGs/final_bin_set_unique.txt
