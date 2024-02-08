#!/bin/bash


export LSF_DOCKER_VOLUMES='/storage1/fs1/rnewberry/Active:/storage1/fs1/rnewberry/Active/'
export LSF_DOCKER_NETWORK=host
export LSF_DOCKER_IPC=host

bsub -Is -n 8 -R 'rusage[mem=32GB]' -q general-interactive -a 'docker(biobakery/metaphlan)' /bin/bash


