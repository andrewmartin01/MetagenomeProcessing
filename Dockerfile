FROM debian:stable-slim
RUN apt-get update \
    && apt-get install -y --no-install-recommends git default-jre default-jdk wget tar unzip libjbzip2-java\
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
#RUN tar -zxvf BBMap_39.06.tar.gz 
RUN tar -zxvf programs_AM/BBtools/download

#RUN chmod +x repair.sh
#install trimmomatic
RUN wget -P programs_AM/ https://github.com/usadellab/Trimmomatic/files/5854859/Trimmomatic-0.39.zip
RUN unzip programs_AM/Trimmomatic-0.39.zip
#install deconseq
RUN wget -P programs_AM/deconseq/ https://sourceforge.net/projects/deconseq/files/latest/download
#RUN tar -zxvf programs/deconseq-standalone-0.4.3.tar.gz  
RUN tar -zxvf programs_AM/deconseq/download 
#
RUN cd ../..

RUN export LSF_DOCKER_VOLUMES=/storage1/fs1/rnewberry/Active:/storage1/fs1/rnewberry/Active
#ENV PATH="$PATH:/usr/games"
#RUN export PATH

