#!/bin/bash

#=========================================================
#File Name: runTrimmomatic.sh
#Description: Runs the trimmomatic function (#1 step in the pipeline)
#Author: Andrew Martin (adapted from Schwartz lab)
#Version: 1.0
#Created on: 02/02/2024

#===========================================================

#variable passed into the function when called 
#$1 
#$2


java -jar trimmomatic-0.38.jar PE /storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/PE_Test_files/ERR101899_1.fastq.gz /storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/PE_Test_files/ERR101899_2.fastq.gz \
     -baseout trimmomatic_out/ERR101899_filtered.fastq.gz \
     ILLUMINACLIP:/opt/apps/trimmomatic/0.38/adapters/NexteraPE-PE.fa:2:30:10:1:TRUE \
     LEADING:10 TRAILING:10 SLIDINGWINDOW:4:20 MINLEN:60