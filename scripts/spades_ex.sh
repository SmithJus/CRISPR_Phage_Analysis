#!/bin/bash
SAMPLE="$1"
echo SAMPLE

cat spades_ex.sh
cat spades_ex.sub
#source /home/glbrc.org/jusmith/miniconda3/etc/profile.d/conda.sh
#source /opt/bifxapps/miniconda3/etc/profile.d/conda.sh
#unset $PYTHONPATH

#conda env list

#conda activate /home/glbrc.org/jusmith/.conda/envs/python
#ls -lh
#tar -xf /home/glbrc.org/jusmith/CRISPR_Phage_Analysis/qced_reads/2005-06-14-EBPR.qced.fastq.tar.gz
#/opt/bifxapps/bin/python3.4 /opt/bifxapps/SPAdes-3.15.4/bin/spades.py --debug --meta -1 R1-2010-08-31_S37_L001_R1_001.fastq.gz -2 R1-2010-08-31_S37_L001_R2_001.fastq.gz -o assemblies_2_19_24
tar -xf /home/glbrc.org/jusmith/CRISPR_Phage_Analysis/qced_reads/${SAMPLE}.qced.fastq.tar.gz \
 -C /home/glbrc.org/jusmith/CRISPR_Phage_Analysis/qced_reads/
#gzip /home/glbrc.org/jusmith/CRISPR_Phage_Analysis/qced_reads/2005-06-14-EBPR.qced.fastq > /home/glbrc.org/jusmith/CRISPR_Phage_Analysis/qced_reads/2005-06-14-EBPR.qced.fastq.gz

/opt/bifxapps/bin/python3.4 /opt/bifxapps/SPAdes-3.15.4/bin/spades.py --debug \
 --meta --12 /home/glbrc.org/jusmith/CRISPR_Phage_Analysis/qced_reads/${SAMPLE}.qced.fastq \
 -o ~/CRISPR_Phage_Analysis/output/assemblies_${SAMPLE}

#spades.py --test
#Exit the new environment
#conda deactivate


