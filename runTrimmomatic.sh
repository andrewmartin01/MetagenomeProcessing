#!/bin/bash

#=========================================================
#File Name:
#Description
#Author: Andrew Martin (adapted from Schwartz lab)
#Version: 1.0
#Created on: 02/02/2024

#===========================================================


java -jar $TRIMMOMATIC_HOME/trimmomatic-0.38.jar PE rawreads/${ID}_R1.fastq.gz rawreads/${ID}_R2.fastq.gz \
     -baseout trimmomatic_out/${ID}_filtered.fastq.gz \
     ILLUMINACLIP:/opt/apps/trimmomatic/0.38/adapters/NexteraPE-PE.fa:2:30:10:1:TRUE \
     LEADING:10 TRAILING:10 SLIDINGWINDOW:4:20 MINLEN:60