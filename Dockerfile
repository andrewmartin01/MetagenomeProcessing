FROM debian:stable-slim
RUN apt-get update \
    && apt-get install -y --no-install-recommends git default-jre default-jdk wget libjbzip2-java\
    && apt-get clean

#fix here I think I need to add he functions that I would like to use
#RUN git remote rm origin
#RUN git remote add origin 'git@github.com:andrewmartin01/MetagenomeProcessing.git'
RUN git clone https://github.com/andrewmartin01/MetagenomeProcessing.git

#install BBtools
RUN wget https://sourceforge.net/projects/bbmap/files/latest/download
RUN unzip BBMap_39.06.tar.gz 
#install trimmomatic
RUN wget https://github.com/usadellab/Trimmomatic/files/5854859/Trimmomatic-0.39.zip 
RUN unzip Trimmomatic-0.39.zip

RUN wget https://sourceforge.net/projects/deconseq/files/latest/download
RUN  deconseq-standalone-0.4.3.tar.gz    

#ENV PATH="$PATH:/usr/lib/"
#ENV PATH="$PATH:/usr/lib/"
#RUN export PATH
#RUN export PATH2
