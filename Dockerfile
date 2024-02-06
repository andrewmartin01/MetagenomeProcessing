FROM debian:stable-slim
RUN apt-get update \
    && apt-get install -y --no-install-recommends git python3 default-jre default-jdk wget tar unzip libjbzip2-java\
    && apt-get clean

#clones git repository into container
RUN git clone https://github.com/andrewmartin01/MetagenomeProcessing.git

#creates directory for installed programs
RUN mkdir programs_AM/
RUN mkdir programs_AM/BBtools/
RUN mkdir programs_AM/deconseq/

#Install functions to be used
#install BBtools
RUN wget -P programs_AM/BBtools/ https://sourceforge.net/projects/bbmap/files/latest/download 
RUN tar -zxvf programs_AM/BBtools/download
#install trimmomatic
RUN wget -P programs_AM/ https://github.com/usadellab/Trimmomatic/files/5854859/Trimmomatic-0.39.zip
RUN unzip programs_AM/Trimmomatic-0.39.zip
#install deconseq
RUN wget -P programs_AM/deconseq/ https://sourceforge.net/projects/deconseq/files/latest/download
RUN tar -zxvf programs_AM/deconseq/download 
#Install metaphlan - taxonomic profiling
RUN wget -P programs_AM/ https://github.com/biobakery/MetaPhlAn/archive/refs/tags/4.0.6.zip
RUN unzip programs_AM/4.0.6.zip
#Install Kraken2 - taxonomic profiling
RUN wget -P programs_AM/ https://github.com/DerrickWood/kraken2/archive/refs/tags/v2.1.3.zip
RUN unzip programs_AM/v2.1.3.zip
#Install Metaspades -Alignment
RUN wget -P programs_AM https://github.com/ablab/spades/archive/refs/heads/spades_3.15.5.zip
RUN unzip programs_AM/spades_3.15.5.zip
#Install HUMAnN3.0 - functional profiling
RUN wget -P programs_AM/ https://github.com/biobakery/humann/archive/refs/heads/master.zip
RUN unzip programs_AM/master.zip
#Install Piecrust - functional profiling
RUN wget -P programs_AM/ https://github.com/picrust/picrust2/archive/refs/tags/v2.5.2.zip
RUN unzip programs_AM/v2.5.2.zip



#changes to home directory
RUN cd ../..
#mounts storage for use inside the container
RUN export LSF_DOCKER_VOLUMES=/storage1/fs1/rnewberry/Active:/storage1/fs1/rnewberry/Active
#calls shell script that runs Trimmomatic
#RUN ./MetagenomeProcessing/runTrimmomatic.sh
#calls shell script that runs deconseq

#calls shell script that runs repair.sh