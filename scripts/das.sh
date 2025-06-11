
#!/bin/bash
SAMPLE=$1
LOCATION=$2
echo ${SAMPLE}
echo ${LOCATION}
cat das.sh
cat das.sub

#source to my conda directory 
source /home/glbrc.org/jusmith/miniconda3/etc/profile.d/conda.sh
#source /opt/bifxapps/miniconda3/etc/profile.d/conda.sh
#conda activate /opt/bifxapps/miniconda3/envs/metawrap
conda activate das_tool

#use Fasta_to_Scaffolds2Bin on maxbin2, metabat1, and metabat2
${LOCATION}/scripts/DAS/src/Fasta_to_Scaffolds2Bin.sh \
	-e fa \
	-i ${LOCATION}/results/metawrap/${SAMPLE}/maxbin2_bins/ \
	 > ${LOCATION}/results/refined_bins_tables/${SAMPLE}_maxbin2_scaf2bin.tsv
${LOCATION}/scripts/DAS/src/Fasta_to_Scaffolds2Bin.sh \
        -e fa \
        -i ${LOCATION}/results/metawrap/${SAMPLE}/metabat1_bins/ \
         > ${LOCATION}/results/refined_bins_tables/${SAMPLE}_metabat1_scaf2bin.tsv
${LOCATION}/scripts/DAS/src/Fasta_to_Scaffolds2Bin.sh \
        -e fa \
        -i ${LOCATION}/results/metawrap/${SAMPLE}/metabat2_bins/ \
         > ${LOCATION}/results/refined_bins_tables/${SAMPLE}_metabat2_scaf2bin.tsv

#Use DAS_Tool
DAS_Tool --write_bins \
--write_bin_evals \
-i ${LOCATION}/results/refined_bins_tables/${SAMPLE}_maxbin2_scaf2bin.tsv,${LOCATION}/results/refined_bins_tables/${SAMPLE}_metabat1_scaf2bin.tsv,${LOCATION}/results/refined_bins_tables/${SAMPLE}_metabat2_scaf2bin.tsv \
-l maxbin2,metabat1,metabat2 \
-c ${LOCATION}/results/assemblies_${SAMPLE}/contigs.fasta \
-o ${LOCATION}/results/refined_bins/${SAMPLE}/refined_bins \
--threads $3

conda deactivate
