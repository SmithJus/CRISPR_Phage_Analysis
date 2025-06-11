#!/bin/bash
LOCATION=$1
echo ${LOCATION}
cat taxonomy.sh
cat taxonomy.sub

#source to my conda directory
source /home/glbrc.org/jusmith/miniconda3/etc/profile.d/conda.sh
conda activate gtdbtk-2.4.0

GTDBTK_DATA_PATH=/mnt/bigdata/processed_data/computational_biology/databases/GTDB/release226

gtdbtk check_install
gtdbtk classify_wf \
--genome_dir ${LOCATION}/results/final_MAGs/ \
--pplacer_cpus $2 \
-x fasta \
--cpus $2 \
--skip_ani_screen \
--out_dir ${LOCATION}/results/gtdbtk/

conda deactivate
