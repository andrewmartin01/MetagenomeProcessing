#!/bin/bash

#gets directory
infile_fwd=/storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/PE_Test_files/${1}
infile_rev=/storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/PE_Test_files/${2}

bsub -n 16 -R 'rusage[mem=32GB]' -q general -a 'docker(biobakery/humann)' metaphlan storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/PE_Test_files/trimmed_unpairedERR101899_1.fastq --input_type fastq --nproc 8 -o scratch1/fs1/rnewberry/Andrew/profiled_metagenome.txt --bowtie2db scratch1/fs1/rnewberry/Andrew/mpa_vJun23_CHOCOPhlAnSGB_202307 --index mpa_vJun23_CHOCOPhlAnSGB_202307