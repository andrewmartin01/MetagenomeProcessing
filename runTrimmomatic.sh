#!/bin/bash

#=========================================================
#File Name: runTrimmomatic.sh
#Description: Runs the trimmomatic function, creating own queue for submission of >5 jobs at one time
#Author: Andrew Martin (adapted from Schwartz lab)
#Version: 1.0
#Created on: 02/02/2024

#===========================================================

export LSF_DOCKER_VOLUMES='/storage1/fs1/rnewberry/Active:/storage1/fs1/rnewberry/Active/ /scratch1/fs1/rnewberry/Andrew:/scratch1/fs1/rnewberry/Andrew'
directory_path=storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/Seq_Files_Real/

#make a job group
bgadd -L 50 /andrew.martin/trimmomatic_compute1

# Use find to get a list of files in the directory
files=$(find "$directory_path" -type f -name "*_001.fastq.gz")

# Iterate through each file
for file1 in $files; do
    # Extract the base name
    base_name=$(basename "$file1" "1_001.fastq.gz")

    # Form the pair file name
    file2="$directory_path$base_name"2_001.fastq.gz

    # Check if the pair file exists
    if [ -e "$file2" ]; then
        #makes a directory for storing the output
        mkdir scratch1/fs1/rnewberry/Andrew/trimmomatic_output/${base_name}/
          
        #runs all of the datasets through trimmomatic and decon of host reads
        bsub -g /andrew.martin/trimmomatic_compute1 -n 16 -R 'rusage[mem=32GB]' -q general -a 'docker(andrewmartin1/metagenome_pipeline:latest)' java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE $file1 $file2 \
               ${basename}_paired_fwd ${basename}_unpaired_fwd\
               ${basename}_paired_rev ${basename}_unpaired_rev\
               ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:8:true LEADING:10 TRAILING:10 MINLEN:50
    fi
done

