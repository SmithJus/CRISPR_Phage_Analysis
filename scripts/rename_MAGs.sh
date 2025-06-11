#!/bin/bash
SAMPLE=$1
LOCATION=$2
echo ${SAMPLE}
echo ${LOCATION}
cat rename_MAGs.sh
cat rename_MAGs.sub

#MAGs need to be called ".fasta" instead of ".fa" for dRep to work
mkdir -p ${LOCATION}/results/refined_bins_renamed/${SAMPLE}/renamed_refined_MAGs
#for loop to rename .fa to .fasta
for file in "${LOCATION}/results/refined_bins/${SAMPLE}/refined_bins_DASTool_bins/"m*; do
	mv "$file" "${file}.fasta"
done
#rename 's/.fa/.fasta/' ${LOCATION}/results/refined_bins/${SAMPLE}/refine_bins_DASTool_bins/*.fa
#Note that this MOVES the refined bins out of the refined_bins folder
mv ${LOCATION}/results/refined_bins/${SAMPLE}/refined_bins_DASTool_bins/*.fasta ${LOCATION}/results/refined_bins_renamed/${SAMPLE}/renamed_refined_MAGs

