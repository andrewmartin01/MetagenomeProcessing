#!/bin/bash

export LSF_DOCKER_VOLUMES='/storage1/fs1/rnewberry/Active:/storage1/fs1/rnewberry/Active/ /scratch1/fs1/rnewberry/Andrew:/scratch1/fs1/rnewberry/Andrew'
export LSF_DOCKER_NETWORK=host
export LSF_DOCKER_IPC=host

bsub -Is -n 16 -R 'rusage[mem=32GB]' -q general-interactive -a 'docker(andrewmartin1/metagenome_pipeline:latest)' /bin/bash