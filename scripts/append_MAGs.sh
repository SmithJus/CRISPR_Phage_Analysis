#!/bin/bash
SAMPLE=$1
LOCATION=$2
echo ${SAMPLE}
echo ${LOCATION}
cat append_MAGs.sh
cat append_MAGs.sub

mkdir -p ${LOCATION}/results/renamed_refined_MAGs

for file in ${LOCATION}/results/refined_bins_renamed_copy/${SAMPLE}/renamed_refined_MAGs/*; \
	do sed -i "s|>NODE|>${SAMPLE}_NODE|g" $file; \
	cp $file ${LOCATION}/results/renamed_refined_MAGs/${SAMPLE}_$(basename $file); \
done
#mv -r ${LOCATION}/results/refined_bins_renamed/${SAMPLE}/renamed_refined_MAGs/* /home/glbrc.org/jusmith/CRISPR_Phage_Analysis/results/refined_renamed_MAGs

#How can I do the txt document trick
#The document would need two columns: 
#    Sample Name            Sample Bin
#Ex: 2005-06-14-EBPR        home/glbrc.org/jusmith/CRISPR_Phage_Analysis/results/refined_bins_renamed/2005-06-14-EBPR/renamed_refined_MAGs/maxbin1.fasta

#Command to append string
#sed 's|>NODE*|>${SAMPLE}_NODE*|g' ${LOCATION}/results/refined_bins_renamed/${SAMPLE}/renamed_refined_MAGs/*.fasta \
#> renamed.fasta
