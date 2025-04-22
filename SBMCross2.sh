#!/bin/bash

subject=$1

cd /home/nathan/Documents/RescanFull/Reconstructions
export SUBJECTS_DIR=$PWD

cp /home/nathan/Documents/ManualEdits/${subject}/talairach.xfm ${subject}/mri/transforms/talairach.xfm

recon-all -s ${subject} -nuintensitycor -normalization
cp ${subject}/mri/T1.mgz ${subject}/mri/brainmask.mgz # brain is already skullstripped, so we can just copy T1.mgz to brainmask.mgz

# # # # # use the corrected talairach.xfm as initialization for the subcortical registration (talairach.lta)
lta_convert --ltavox2vox --inmni ${subject}/mri/transforms/talairach.xfm \
--outlta ${subject}/mri/transforms/talairach.lta \
--src ${subject}/mri/T1.mgz --trg $FREESURFER_HOME/average/RB_all_2016-05-10.vc700.gca

# # # # # # # # # rest of pipeline
recon-all -s ${subject} -autorecon2 -nogcareg -autorecon3