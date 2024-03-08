#!/bin/bash

#Author: Andrew Martin
#Date:
#purpose:

export LSF_DOCKER_VOLUMES='/storage1/fs1/rnewberry/Active:/storage1/fs1/rnewberry/Active/ /scratch1/fs1/rnewberry/Andrew:/scratch1/fs1/rnewberry/Andrew'
directory_path=storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/Seq_Files_Real/

#make a job group
bgadd -L 50 /andrew.martin/HumanN

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
          
        #runs humanN on all samples for functional profiling
        bsub -g /andrew.martin/HumanN -n 20 -R 'rusage[mem=32GB]' -q general -a 'docker(biobakery/humann)'  
    fi
done
