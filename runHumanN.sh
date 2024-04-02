#!/bin/bash

#Author: Andrew Martin
#Date:
#purpose:

export LSF_DOCKER_VOLUMES='/storage1/fs1/rnewberry/Active:/storage1/fs1/rnewberry/Active/ /scratch1/fs1/rnewberry/Andrew:/scratch1/fs1/rnewberry/Andrew'
directory_path=scratch1/fs1/rnewberry/Andrew/trimmomatic_output/

#make a job group
bgadd -L 50 /andrew.martin/HumanN

# Use find to get a list of files in the directory
files=$(find "$directory_path" -type f -name "*.fastq.gz")

# Iterate through each file
for file1 in $files; do

    #makes a directory for storing the output
    #mkdir scratch1/fs1/rnewberry/Andrew/trimmomatic_output/${base_name}/
          
    #runs humanN on all samples for functional profiling
    bsub -g /andrew.martin/HumanN -n 20 -R 'rusage[mem=32GB]' -q general -a 'docker(biobakery/humann)' --input $directory_path/${file1} --output storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/HumanN_output/ --nucleotide-database /storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/HumanN_database/HumanN_Chocophlan --protein-database /storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/HumanN_database/UniRef90_db
    
done
