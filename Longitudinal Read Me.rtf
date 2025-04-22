{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww14200\viewh12920\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 READ ME- LONGITUDINAL PROCESSING\
\
Processing longitudinal data using AutoMacq requires the additional steps outlined below:\
\
1) Longitudinal Voxel-based processing:\
-After Cropping and Manual Reorientation (see cross-sectional read me file), the SPM batch \'91Long_Reg\'92 should be opened. The batch has two modules, one for T1 data and the other for T2 data. If T2 data is unavailable the second module should be deleted. \
-In the \'91Volumes\'92 section all of the scans should be input in chronological order.\
-In the \'91Times\'92 section input the time between scans in years (with a precision of 2 decimal places), the first scan being 0.\
-The batch can then be saved and ran. Average T1 and T2 (if available) scans will be output.\
-The rest of the steps to carry out voxel-based processing (see the Cross-sectional Read Me) are then ran using the average files.\
\
2) Longitudinal Surface-based processing:\
-First process all scans for a subject cross-sectionally (see Cross-Sectional Read Me). \
-Next open the script \'93LongSurf1\'94 and set the file path and file names\
-Run the script \'93LongSurf1\'94 \
-Use the command \'91tkregister2 \'97s <Subject> \'97fstal\'92 to open the graphical interface\
--Translate, Scale and Rotate the brain so that it aligns as closely as possible to the target on all 3 planes (coronal. Sagittal and horizontal).\
-Once aligned click \'92SAVE REG\'92 and close the tkregister2 graphical interface.\
-Next open the script \'93LongSurf2\'94 and set the file path and file names\
-Save and run the script\
-This produces the base files for each subject\
-Finally, run the command \'93Recon-all -long <timepoint> <Subject> -all -notalcheck\'94 for every timepoint and subject.\
\
\
\
Recon-all -base <Subject> -tp TP1 -tp TP2 \'85 -autorecon1 -notalcheck\
Recon-all -base <Subject> -tp TP1 -tp TP2 \'85 -talairach -use-mritotal -clean-tal\
\
tkregister2 \'97s <Subject> \'97fstal\
\
Recon-all -base <Subject> -tp TP1 -tp TP2 \'85 -nuintensitycor -normalization\
\
lta_convert --ltavox2vox --inmni $\{subject\}/mri/transforms/talairach.xfm \\\
--outlta $\{subject\}/mri/transforms/talairach.lta \\\
--src $\{subject\}/mri/T1.mgz --trg $FREESURFER_HOME/average/RB_all_2016-05-10.vc700.gca\
\
Recon-all -base <Subject> -tp TP1 -tp TP2 \'85 -autorecon2 -nogcareg -autorecon3\
\
\
Recon-all -long <timepoint> <Subject> -all -notalcheck\
\
\
Recon-all -long TP1 <Subject> -fill\
Recon-all -long TP1 <Subject> -tessellate\
Recon-all -long TP1 <Subject> -smooth1\
Recon-all -long TP1 <Subject> -inflate1\
Recon-all -long TP1 <Subject> -qsphere\
Recon-all -long TP1 <Subject> -fix\
Recon-all -long TP1 <Subject> -white\
Recon-all -long TP1 <Subject> -smooth2\
Recon-all -long TP1 <Subject> -inflate2\
Recon-all -long TP1 <Subject> -curvHK\
Recon-all -long TP1 <Subject> -curvstats\
Recon-all -long TP1 <Subject> -autorecon3\
\
Recon-all -base <Subject> -tp TP1 -tp TP2 \'85 -fill\
Recon-all -base <Subject> -tp TP1 -tp TP2 \'85 -tessellate\
Recon-all -base <Subject> -tp TP1 -tp TP2 \'85 -smooth1\
Recon-all -base <Subject> -tp TP1 -tp TP2 \'85 -inflate1\
Recon-all -base <Subject> -tp TP1 -tp TP2 \'85 -qsphere\
Recon-all -base <Subject> -tp TP1 -tp TP2 \'85 -fix\
Recon-all -base <Subject> -tp TP1 -tp TP2 \'85 -white\
Recon-all -base <Subject> -tp TP1 -tp TP2 \'85 -smooth2\
Recon-all -base <Subject> -tp TP1 -tp TP2 \'85 -inflate2\
Recon-all -base <Subject> -tp TP1 -tp TP2 \'85 -curvHK\
Recon-all -base <Subject> -tp TP1 -tp TP2 \'85 -curvstats\
Recon-all -base <Subject> -tp TP1 -tp TP2 \'85 -autorecon3\
\
\
\
\
}