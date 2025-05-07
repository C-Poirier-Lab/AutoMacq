#!/bin/bash

subject=$1

cd /home/Documents/MRI/Reconstructions
export SUBJECTS_DIR=$PWD

recon-all -i /home/Documents/MRI/${subject}/T1MaskBias.nii.gz -s ${subject} -motioncor -talairach -hires
recon-all -s ${subject} -talairach -use-mritotal -clean-tal # alternative talairach transform
