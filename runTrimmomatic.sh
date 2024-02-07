#!/bin/bash

#=========================================================
#File Name: runTrimmomatic.sh
#Description: Runs the trimmomatic function (#1 step in the pipeline)
#Author: Andrew Martin (adapted from Schwartz lab)
#Version: 1.0
#Created on: 02/02/2024

#===========================================================

#variable passed into the function when called 
infile_fwd=/storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/PE_Test_files/${1}
infile_rev=/storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/PE_Test_files/${2}

output_paired_fwd=/storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/PE_Test_files/trimmed_paired${1}
output_paired_rev=/storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/PE_Test_files/trimmed_paired${2}

output_unpaired_fwd=/storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/PE_Test_files/trimmed_unpaired${1}
output_unpaired_rev=/storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/PE_Test_files/trimmed_unpaired${2}

java -jar ../Trimmomatic-0.39/trimmomatic-0.39.jar PE $infile_fwd $infile_rev \
     $output_paired_fwd $output_unpaired_fwd\
     $output_paired_rev $output_unpaired_rev\
     ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:8:true LEADING:10 TRAILING:10 MINLEN:50