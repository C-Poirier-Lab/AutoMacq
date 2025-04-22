READ ME- CROSS-SECTIONAL PIPELINE\
\
Below is the recommended steps for processing cross-sectional MRI data through AutoMacq:\
\
1) Cropping and Manual Reorientation: \
-If the scan has a large field of view then it should first be opened and cropped in FreeSurfer using the Freeview function.\
-The scan will then need to be manually reoriented to match the orientation and origin of the chosen atlas. This can be done using the display function in SPM.\
-This step should be done for both T1 and T2 scans.\
\
2) Co-registration between T1 and T2: \
-If T2 scans are available, the SPM batch \'coregister\' should be opened. If T2 data is not available, skip this step.\
-Input the T1 scan in \'reference image\' section and the T2 scan in \'source image\'. \
-Save and run the batch\
\
3) Creation of precursor mask and initial brain extraction:\
-The SPM batch \'segmentation\' is next opened. \
-In the \'volumes\' section of channel 1 the T1 scan is input, if T2 data is available then the co-registered T2 scan is input in the \'volumes\' section of channel 2 (if T2 data is not available, channel 2 should be deleted). \
-The tissue probability (prior) maps from the chosen template files then need to be input in the \'tissues section\'. \
-The batch can then be saved and ran.\
-The SPM batch \'write_def\' is next opened.\
-In the \'images to write\' section input the \'mask\' from the chosen template files. \
-In the \'deformation field\' section input the \' iy_\'85\' file created by the previous segmentation batch. \
-The \'filename prefix\' should be changed to ensure there is no confusion with later uses of this batch. \
-Save and run the batch.\
-Load the SPM batch \'masking_batch\' \
-Set the output directory and and output filename. In the first module input the T1 file followed by the mask created using the \'write_def\' batch. In the second module input the T2 file followed by the mask created using the \'write_def\' batch.\
-Save and run the batch.\
-Visualise the masked T1 scan. If non-brain tissue is still present then repeat stage 3 until this non-brain tissue is minimised as much as possible, without losing any brain tissue before moving on to stage 4 (some non-brain tissue is likely to remain as this is only a rough, precursor mask).\
\
4) Bias correction:\
-Input files needed: original T1 file and precursor mask. If T2 data is available then also need: Masked T1 and Masked T2. Transfer files as needed so that linux scripts can be carried out.\
-Open the script \'DenoiseBiasCor\' and set the file path and file names. Save the script.\
-Run the script. If only T1 data is available then the output file of \'denoised_N4.nii.gz\' is needed, move now to step 5. If T2 data is available continue with this step, utilising the output file \'denoised_N4_masked.nii.gz\'.\
-Open the script \'HCPBiasCor\' and set the file path and file names.\
-Save and run the script.\
-The output files \'T1Bias\' and \'T2Bias\' can then be utilised in step 5.\
-Note that gz files will need to be extracted or converted in order to attain .nii files.\
\
5) Creation of Final Mask and Brain extraction:\
-Input files needed: Either \'denoised_N4.nii\' or \'T1bias.nii\' and \'T2bias.nii\'. Transfer files as needed so that SPM batches can be carried out.\
-Follow the steps of stage 3 but utilising the bias corrected images in order to obtain a final mask and masked images that do not include non-brain tissue.\
\
6) Tissue Segmentation:\
-Open the batch \'FinalSeg\'. \
-Set the file path and file names. \
-Save and run the batch.\
-This step gives the final VBM outputs needed for both statistical analysis and surface-based processing.\
\
7) Surface-based Cross-sectional Processing:\
-Input files needed: final masked T1 (and final masked T2 if available)\
-Open the script \'SBMCross1\' and set the file path and file names\
-Save and run the script.\
-Use the command \'tkregister2 \'97s <Subject> \'97fstal\' to open the graphical interface\
-Translate, Scale and Rotate the brain so that it aligns as closely as possible to the target on all 3 planes (coronal. Sagittal and horizontal).\
-Once aligned click \'SAVE REG\' and close the tkregister2 graphical interface.\
-Open the script \'SBMCross2\' and set the file path and file names\
-Save and run the script\
-This produces the final outputs needed for statistical analyses.\
}
