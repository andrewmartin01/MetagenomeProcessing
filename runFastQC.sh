#!/bin/bash

export LSF_DOCKER_VOLUMES='/storage1/fs1/rnewberry/Active:/storage1/fs1/rnewberry/Active/ /scratch1/fs1/rnewberry/Andrew:/scratch1/fs1/rnewberry/Andrew'
directory_path=storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/Seq_Files_Real/

#make a job group
bgadd -L 50 /andrew.martin/runFastQC

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
        mkdir scratch1/fs1/rnewberry/Andrew/trim_decon_output/${base_name}/

        #runs all of the datasets through trimmomatic and decon of host reads
        bsub -g /andrew.martin/runFastQC -n 8 -R 'rusage[mem=16GB]' -q general -a 'docker(andrewmartin1/metagenome_pipeline)' kneaddata --input $file1 --input $file2 -db scratch1/fs1/rnewberry/Andrew/decon/mouse_C57BL_6NJ --sequencer-source TruSeq3 --run-trim-repetitive --fastqc PATHTOFASTQC --output scratch1/fs1/rnewberry/Andrew/trim_decon_output/${base_name}/

    fi
done
