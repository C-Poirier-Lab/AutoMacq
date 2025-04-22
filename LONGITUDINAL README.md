README- LONGITUDINAL PROCESSING\
\
Processing longitudinal data using AutoMacq requires the additional steps outlined below:\
\
1) Longitudinal Voxel-based processing:\
-After Cropping and Manual Reorientation (see cross-sectional read me file), the SPM batch \'Long_Reg\' should be opened. The batch has two modules, one for T1 data and the other for T2 data. If T2 data is unavailable the second module should be deleted. \
-In the \'Volumes\' section all of the scans should be input in chronological order.\
-In the \'Times\' section input the time between scans in years (with a precision of 2 decimal places), the first scan being 0.\
-The batch can then be saved and ran. Average T1 and T2 (if available) scans will be output.\
-The rest of the steps to carry out voxel-based processing (see the Cross-sectional Read Me) are then ran using the average files.\
\
2) Longitudinal Surface-based processing:\
-First process all scans for a subject cross-sectionally (see Cross-Sectional Read Me). \
-Next open the script \'LongSurf1\' and set the file path and file names\
-Run the script \'LongSurf1\' \
-Use the command \'tkregister2 \'s <Subject> \'fstal\' to open the graphical interface\
--Translate, Scale and Rotate the brain so that it aligns as closely as possible to the target on all 3 planes (coronal. Sagittal and horizontal).\
-Once aligned click \'SAVE REG\' and close the tkregister2 graphical interface.\
-Next open the script \'LongSurf2\' and set the file path and file names\
-Save and run the script\
-This produces the base files for each subject\
-Finally, run the command \'Recon-all -long <timepoint> <Subject> -all -notalcheck\' for every timepoint and subject.\
\
