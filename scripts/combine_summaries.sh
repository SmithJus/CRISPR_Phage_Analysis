#!/bin/bash
SAMPLE=$1
LOCATION=$2
echo ${SAMPLE}
echo ${LOCATION}
cat combine_summaries.sh
cat combine_summaries.sub

#mkdir -p ${LOCATION}/results/renamed_refined_MAGs
#cp $file ${LOCATION}/results/renamed_refined_MAGs/${SAMPLE}_$(basename $file); \

#replace "bin" with "${SAMPLE}_bin" in checkm quality summaries
for file in ${LOCATION}/results/checkm_for_dRep_V5/${SAMPLE}/quality_summary_awk.csv; \
	do sed -i "s|maxbin2|${SAMPLE}_maxbin2|g" $file; \
	sed -i "s|metabat1|${SAMPLE}_metabat1|g" $file; \
        sed -i "s|metabat2|${SAMPLE}_metabat2|g" $file; \
done

#concatenate quality_summaries into a central text doc
#reverse sort the file so that the column names are at the top
#remove repeat rows so that there is only one header
cat ${LOCATION}/results/checkm_for_dRep_V5/*/quality_summary_awk.csv | sort -r | uniq > ${LOCATION}/results/checkm_revised_summaries/quality_summaries.csv


