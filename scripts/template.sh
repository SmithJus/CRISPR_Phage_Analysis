#!/bin/bash

#Declare variables and echo scripts + variables
VAR=$1
echo "VAR"
cat "EXECUTABLE.sh"
cat "SUBMIT.sub"

#source to my conda direcotyr and activate conda environment
source /home/glbrc.org/jusmith/miniconda3/etc/profile.d/conda.sh
conda activate "CONDA ENV"

#MAIN

#deactivate conda env
conda deactivate
