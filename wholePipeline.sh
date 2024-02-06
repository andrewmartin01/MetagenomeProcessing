#!/bin/bash

#=========================================================
#File Name: runTrimmomatic.sh
#Description: Runs the entire pipeline for a given folder
#Author: Andrew Martin
#Version: 1.0
#Created on: 02/06/2024

#===========================================================

#Counts the number of files and divides by two for the paired end reads
numFiles=$(ls /storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/PE_Test_files/*.fastq | wc -l) 
numFiles=$numFiles/2

for i in /storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/PE_Test_files/*.fastq:
do



done


for i in numFiles:
do 

.\runTrimmomatic.sh 
.\runDeconSeq.sh
.\runRepair.sh
.\run


done