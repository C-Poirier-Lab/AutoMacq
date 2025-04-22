#!/bin/bash 
set -e
 
echo -e "\n START: BiasFieldCorrection"
 
subject=$1

WorkingDirectory="/Users/nathan/Desktop/FSFiles2021/${subject}"
T1wImage="denoised_N4.nii.gz"
T1wImageBrain="denoised_N4_masked.nii.gz"
T2wImage="T2.nii"
OutputBiasField="OutBias.nii.gz"
OutputT1wRestoredImage="T1Bias.nii.gz"
OutputT1wRestoredBrainImage="T1MaskBias.nii.gz"
OutputT2wRestoredImage="T2Bias.nii.gz"
OutputT2wRestoredBrainImage="T2MaskBias.nii.gz"

Factor="0.5" #Leave this at 0.5 for now it is the number of standard deviations below the mean to threshold the non-brain tissues at
BiasFieldSmoothingSigma='5' #Leave this at 5mm for now

cd "$WorkingDirectory"
# Form sqrt(T1w*T2w), mask this and normalise by the mean
fslmaths $T1wImage -mul $T2wImage -abs -sqrt T1wmulT2w.nii.gz -odt float
fslmaths T1wmulT2w.nii.gz -mas $T1wImageBrain T1wmulT2w_brain.nii.gz
meanbrainval=`fslstats T1wmulT2w_brain.nii.gz -M`
fslmaths T1wmulT2w_brain.nii.gz -div $meanbrainval T1wmulT2w_brain_norm.nii.gz

# Smooth the normalised sqrt image, using within-mask smoothing : s(Mask*X)/s(Mask)
${FSLDIR}/bin/fslmaths T1wmulT2w_brain_norm.nii.gz -bin -s $BiasFieldSmoothingSigma SmoothNorm_s${BiasFieldSmoothingSigma}.nii.gz
${FSLDIR}/bin/fslmaths T1wmulT2w_brain_norm.nii.gz -s $BiasFieldSmoothingSigma -div SmoothNorm_s${BiasFieldSmoothingSigma}.nii.gz T1wmulT2w_brain_norm_s${BiasFieldSmoothingSigma}.nii.gz

# Divide normalised sqrt image by smoothed version (to do simple bias correction)
${FSLDIR}/bin/fslmaths T1wmulT2w_brain_norm.nii.gz -div T1wmulT2w_brain_norm_s$BiasFieldSmoothingSigma.nii.gz T1wmulT2w_brain_norm_modulate.nii.gz

# Create a mask using a threshold at Mean - 0.5*Stddev, with filling of holes to remove any non-grey/white tissue.
STD=`fslstats T1wmulT2w_brain_norm_modulate.nii.gz -S`
echo $STD
MEAN=`fslstats T1wmulT2w_brain_norm_modulate.nii.gz -M`
echo $MEAN
Lower=`echo "$MEAN - ($STD * $Factor)" | bc -l`
echo $Lower
fslmaths T1wmulT2w_brain_norm_modulate.nii.gz -thr $Lower -bin -ero -mul 255 T1wmulT2w_brain_norm_modulate_mask.nii.gz
# echo 'export PATH=Applications/freesurfer/7.1.1/workbench/bin_macosx64'>>~/.bash_profile
source $PATH/wb_command -volume-remove-islands T1wmulT2w_brain_norm_modulate_mask.nii.gz T1wmulT2w_brain_norm_modulate_mask.nii.gz

# Extrapolate normalised sqrt image from mask region out to whole FOV
fslmaths T1wmulT2w_brain_norm.nii.gz -mas T1wmulT2w_brain_norm_modulate_mask.nii.gz -dilall bias_raw.nii.gz -odt float
fslmaths bias_raw.nii.gz -s $BiasFieldSmoothingSigma $OutputBiasField

# Use bias field output to create corrected images
fslmaths $T1wImage -div $OutputBiasField -mas $T1wImageBrain $OutputT1wRestoredBrainImage -odt float
fslmaths $T1wImage -div $OutputBiasField $OutputT1wRestoredImage -odt float
fslmaths $T2wImage -div $OutputBiasField -mas $T1wImageBrain $OutputT2wRestoredBrainImage -odt float
fslmaths $T2wImage -div $OutputBiasField $OutputT2wRestoredImage -odt float

echo -e "\n END: BiasFieldCorrection"

