#!/bin/bash
LOCATION=$1
echo ${LOCATION}
cat transfer_gtdbtk_data.sh
cat transfer_gtdbtk_data.sub

cp /mnt/bigdata/processed_data/computational_biology/databases/GTDB/gtdbtk_r214_data.tar.gz /home/glbrc.org/jusmith/databases/.

tar -xvzf /home/glbrc.org/jusmith/databases/gtdbtk_r214_data.tar.gz

rm gtdbtk_r214_data.tar.gz

