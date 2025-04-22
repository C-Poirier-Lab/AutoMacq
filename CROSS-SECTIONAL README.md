{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww12680\viewh12920\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 READ ME- CROSS-SECTIONAL PIPELINE\
\
Below is the recommended steps for processing cross-sectional MRI data through AutoMacq:\
\
1) Cropping and Manual Reorientation: \
-If the scan has a large field of view then it should first be opened and cropped in FreeSurfer using the Freeview function.\
-The scan will then need to be manually reoriented to match the orientation and origin of the chosen atlas. This can be done using the display function in SPM.\
-This step should be done for both T1 and T2 scans.\
\
2) Co-registration between T1 and T2: \
-If T2 scans are available, the SPM batch \'91coregister\'92 should be opened. If T2 data is not available, skip this step.\
-Input the T1 scan in \'91reference image\'92 section and the T2 scan in \'91source image\'92. \
-Save and run the batch\
\
3) Creation of precursor mask and initial brain extraction:\
-The SPM batch \'91segmentation\'92 is next opened. \
-In the \'91volumes\'92 section of channel 1 the T1 scan is input, if T2 data is available then the co-registered T2 scan is input in the \'91volumes\'92 section of channel 2 (if T2 data is not available, channel 2 should be deleted). \
-The tissue probability (prior) maps from the chosen template files then need to be input in the \'91tissues section\'92. \
-The batch can then be saved and ran.\
-The SPM batch \'91write_def\'92 is next opened.\
-In the \'91images to write\'92 section input the \'91mask\'92 from the chosen template files. \
-In the \'91deformation field\'92 section input the \'91 iy_\'85\'92 file created by the previous segmentation batch. \
-The \'91filename prefix\'92 should be changed to ensure there is no confusion with later uses of this batch. \
-Save and run the batch.\
-Load the SPM batch \'91masking_batch\'92 \
-Set the output directory and and output filename. In the first module input the T1 file followed by the mask created using the \'91write_def\'92 batch. In the second module input the T2 file followed by the mask created using the \'91write_def\'92 batch.\
-Save and run the batch.\
-Visualise the masked T1 scan. If non-brain tissue is still present then repeat stage 3 until this non-brain tissue is minimised as much as possible, without losing any brain tissue before moving on to stage 4 (some non-brain tissue is likely to remain as this is only a rough, precursor mask).\
\
4) Bias correction:\
-Input files needed: original T1 file and precursor mask. If T2 data is available then also need: Masked T1 and Masked T2. Transfer files as needed so that linux scripts can be carried out.\
-Open the script \'91DenoiseBiasCor\'92 and set the file path and file names. Save the script.\
-Run the script. If only T1 data is available then the output file of \'91denoised_N4.nii.gz\'92 is needed, move now to step 5. If T2 data is available continue with this step, utilising the output file \'91denoised_N4_masked.nii.gz\'92.\
-Open the script \'91HCPBiasCor\'92 and set the file path and file names.\
-Save and run the script.\
-The output files \'92T1Bias\'92 and \'92T2Bias\'92 can then be utilised in step 5.\
-Note that gz files will need to be extracted or converted in order to attain .nii files.\
\
5) Creation of Final Mask and Brain extraction:\
-Input files needed: Either \'91denoised_N4.nii\'92 or \'91T1bias.nii\'92 and \'91T2bias.nii\'92. Transfer files as needed so that SPM batches can be carried out.\
-Follow the steps of stage 3 but utilising the bias corrected images in order to obtain a final mask and masked images that do not include non-brain tissue.\
\
6) Tissue Segmentation:\
-Open the batch \'91FinalSeg\'92. \
-Set the file path and file names. \
-Save and run the batch.\
-This step gives the final VBM outputs needed for both statistical analysis and surface-based processing.\
\
7) Surface-based Cross-sectional Processing:\
-Input files needed: final masked T1 (and final masked T2 if available)\
-Open the script \'91SBMCross1\'92 and set the file path and file names\
-Save and run the script.\
-Use the command \'91tkregister2 \'97s <Subject> \'97fstal\'92 to open the graphical interface\
-Translate, Scale and Rotate the brain so that it aligns as closely as possible to the target on all 3 planes (coronal. Sagittal and horizontal).\
-Once aligned click \'92SAVE REG\'92 and close the tkregister2 graphical interface.\
-Open the script \'91SBMCross2\'92 and set the file path and file names\
-Save and run the script\
-This produces the final outputs needed for statistical analyses.\
}
