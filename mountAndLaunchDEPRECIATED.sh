#!/bin/bash

export LSF_DOCKER_VOLUMES='/path/to/storage:/path/to/storage /path/to/scratch:/path/to/scratch'
export LSF_DOCKER_NETWORK=host
export LSF_DOCKER_IPC=host

bsub -n 8 -R 'rusage[mem=128GB]' -Is -q general-interactive -a 'docker(andrewmartin01/metagenome_pipeline:latest)'  -t 8 -o 