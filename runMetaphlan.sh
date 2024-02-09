#!/bin/bash

#unzip fastq file


#gets directory
infile_fwd=/storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/PE_Test_files/${1}
infile_rev=/storage1/fs1/rnewberry/Active/Andrew_metagenome_seq/PE_Test_files/${2}

metaphlan $infile1,$infile2 --bowtie2out metagenome.bowtie.bz2 --nproc 8 --input_type fastq -o profiled_metagenome_ERR101899.txt
