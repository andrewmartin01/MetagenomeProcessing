#!/bin/bash
export LSF_DOCKER_VOLUMES='/storage1/fs1/rnewberry/Active:/storage1/fs1/rnewberry/Active/ /scratch1/fs1/rnewberry/Andrew:/scratch1/fs1/rnewberry/Andrew'
directory_path=/scratch1/fs1/rnewberry/Andrew/trimmomatic_output

#make a job group
bgadd -L 50 /andrew.martin/trim_decon_compute1

# Use find to get a list of files in the directory
files=$(find "$directory_path" -type f -name "*.fastq.gz")

# Iterate through each file
for file1 in $files; do
    # Extract the base name
    base_name=$(basename "$file1" "fwd.fastq.gz")

    # Form the pair file name
    file2="$directory_path$base_name"rev.fastq.gz

    # Check if the pair file exists
    if [ -e "$file2" ]; then
        #makes a directory for storing the output
        #mkdir scratch1/fs1/rnewberry/Andrew/trim_decon_output/${base_name}/

        #runs all of the datasets through trimmomatic and decon of host reads
        bsub -g /andrew.martin/trim_decon_compute1 -n 16 -R 'rusage[mem=32GB]' -q general -a 'docker(biobakery/kneaddata)' kneaddata --input $file1 --input $file2 -db storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/KneadDataDecon/mouse_C57BL_6NJ --output scratch1/fs1/rnewberry/Andrew/trim_decon_output/${base_name}/ --sequencer-source TruSeq3 --bypass-trim

    #fi
done

