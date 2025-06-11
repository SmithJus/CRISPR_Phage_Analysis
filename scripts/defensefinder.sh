#!/bin/bash
BIN=$1
LOCATION=$2
echo ${LOCATION}
echo ${BIN}
cat defensefinder.sh
cat defensefinder.sub

#source to my conda directory and activate conda env
source /home/glbrc.org/jusmith/miniconda3/etc/profile.d/conda.sh
conda activate defensefinder

export HOME=/home/glbrc.org/jusmith

# Added bin variable into output to give unique output
defense-finder run ${LOCATION}/results/renamed_refined_MAGs/${BIN} -o ${LOCATION}/results/defensefinderV2/${BIN}/

#deactivate conda env
conda deactivate
