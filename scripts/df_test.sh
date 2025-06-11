#!/bin/bash
#BIN=$1
LOCATION=$1
#echo ${LOCATION}
#echo ${BIN}
cat df_test.sh
cat df_test.sub

#source to my conda directory and activate conda env
source /home/glbrc.org/jusmith/miniconda3/etc/profile.d/conda.sh
conda activate defensefinder

export HOME=/home/glbrc.org/jusmith

defense-finder run ${LOCATION}/results/renamed_refined_MAGs/test/2011-01-10-EBPR_metabat2_bin.2.faa -o ${LOCATION}/results/defensefinder/test/

#deactivate conda env
conda deactivate
