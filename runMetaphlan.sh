#!/bin/bash

export LSF_DOCKER_VOLUMES='/storage1/fs1/rnewberry/Active:/storage1/fs1/rnewberry/Active/ /scratch1/fs1/rnewberry/Andrew:/scratch1/fs1/rnewberry/Andrew'
directory_path=/scratch1/fs1/rnewberry/Andrew/trimmomatic_output/

#make a job group
bgadd -L 50 /andrew.martin/metaphlan

# Use find to get a list of files in the directory
files=$(find "$directory_path" -type f -name "*.fastq")

#unzips the files 
#gunzip files

# Iterate through each file
for file1 in $files; do
    # Extract the base name
    base_name=$(basename "$file1" "fwd.fastq")

    # Form the pair file name
    file2="$directory_path$base_name"rev.fastq

    # Check if the pair file exists
    if [ -e "$file2" ]; then
        #makes a directory for storing the output
        #mkdir scratch1/fs1/rnewberry/Andrew/trim_decon_output/${base_name}/

        #runs all of the datasets through trimmomatic and decon of host reads
        bsub -g /andrew.martin/metaphlan -n 20 -R 'rusage[mem=32GB]' -q general -a 'docker(biobakery/humann)' metaphlan $file1,$file2 --input_type fastq --nproc 20 -o scratch1/fs1/rnewberry/Andrew/metaphlan_output/${base_name}_profiled_metagenome.txt --bowtie2out scratch1/fs1/rnewberry/Andrew/metaphlan_output/${base_name}metagenome.bowtie2.bz2 --bowtie2db storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/metaphlan_database/ --index mpa_vJun23_CHOCOPhlAnSGB_202307

    fi
done


