#!/bin/bash

export LSF_DOCKER_VOLUMES='/path/to/storage:/path/to/storage /path/to/scratch:/path/to/scratch'
export LSF_DOCKER_NETWORK=host
export LSF_DOCKER_IPC=host

bsub -n 8 -R 'rusage[mem=32GB]' -G compute-workshop -q workshop -a 'docker(bioslimcontainers/bwa-samtools:bwa-0.7.17_samtools-1.9_3)' bwa mem -t 8 -o /path/to/output.sam /path/to/reference.fa /path/to/reads_1.fastq /path/to/reads_2.fastq