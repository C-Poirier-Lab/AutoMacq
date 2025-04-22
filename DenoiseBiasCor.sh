#!/bin/bash

subject=$1

cd /home/nathan/Documents/RescanFull/${subject}
# source /Applications/freesurfer/startfreesurfer #different for linux but already called 

# # # Preparation
DenoiseImage -i T1.nii -o denoised.nii.gz -v # denoise
CopyImageHeaderInformation denoised.nii.gz brainmask.nii brainmask.nii.gz 1 1 1 0 # put brainmask in same field dimensions
N4BiasFieldCorrection -i denoised.nii.gz -x brainmask.nii.gz -o denoised_N4.nii.gz -c [1000x1000x1000x1000,0] -v # bias field corrections
fslmaths denoised_N4.nii.gz -mul brainmask.nii.gz denoised_N4_masked.nii.gz # mask brain
