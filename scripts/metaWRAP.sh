#!/bin/bash
SAMPLE=$1
LOCATION=$2
echo ${SAMPLE}
echo ${LOCATION}
cat metaWRAP.sh
cat metaWRAP.sub
source /opt/bifxapps/miniconda3/etc/profile.d/conda.sh
conda activate /opt/bifxapps/miniconda3/envs/metawrap

###
#metawrap binning -o  -a $LOCATION \
#        -t 20 \
#        --metabat1 --metabat2 --maxbin2 \
#        {input.r1_unzip} {input.r2_unzip}

metawrap binning -o ${LOCATION}/output/metawrap/${SAMPLE} \
	-a ${LOCATION}/output/assemblies_${SAMPLE}/contigs.fasta \
	-t $3 \
	--metabat1 --metabat2 --maxbin2 \
	--interleaved ${LOCATION}/qced_reads/${SAMPLE}.qced.fastq

conda deactivate

#conda activate /home/glbrc.org/jusmith/.conda/envs/python
