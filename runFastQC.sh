#!/bin/bash

export LSF_DOCKER_VOLUMES='/storage1/fs1/rnewberry/Active:/storage1/fs1/rnewberry/Active/ /scratch1/fs1/rnewberry/Andrew:/scratch1/fs1/rnewberry/Andrew'
directory_path=storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/Seq_Files_Real/

#make a job group
bgadd -L 100 /andrew.martin/runFastQC1

# Use find to get a list of files in the directory
files=$(find "$directory_path" -type f -name "*_001.fastq.gz")

# Iterate through each file
for file1 in $files; do

    #makes a directory for storing the output
    mkdir scratch1/fs1/rnewberry/Andrew/fastQC_output/${file1}/

    #runs all of the datasets through trimmomatic and decon of host reads
    bsub -g /andrew.martin/runFastQC1 -n 8 -R 'rusage[mem=16GB]' -q general -a 'docker(andrewmartin1/metagenome_pipeline:latest)' FastQC/fastqc ${file1} --outdir=scratch1/fs1/rnewberry/Andrew/fastQC_output/

done
