FROM debian:stable-slim
RUN apt-get update \
    && apt-get install -y --no-install-recommends git python3 pipx python3-pip default-jre perl default-jdk wget tar unzip libjbzip2-java\
    && apt-get clean

#clones git repository into container
RUN git clone https://github.com/andrewmartin01/MetagenomeProcessing.git

#creates directory for installed programs
RUN mkdir programs_AM/
RUN mkdir programs_AM/BBtools/
RUN mkdir programs_AM/deconseq/

#Install functions to be used
#install BBtools
#RUN wget -P programs_AM/BBtools/ https://sourceforge.net/projects/bbmap/files/latest/download 
#RUN tar -zxvf programs_AM/BBtools/download
#install trimmomatic
RUN wget -P programs_AM/ https://github.com/usadellab/Trimmomatic/files/5854859/Trimmomatic-0.39.zip
RUN unzip programs_AM/Trimmomatic-0.39.zip
#install deconseq
#RUN wget -P programs_AM/deconseq/ https://sourceforge.net/projects/deconseq/files/latest/download
#RUN tar -zxvf programs_AM/deconseq/download 
#Install Kraken2 - taxonomic profiling
#RUN wget -P programs_AM/ https://github.com/DerrickWood/kraken2/archive/refs/tags/v2.1.3.zip
#RUN unzip programs_AM/v2.1.3.zip
#Install Metaspades -Alignment
#RUN wget -P programs_AM https://github.com/ablab/spades/archive/refs/heads/spades_3.15.5.zip
#RUN unzip programs_AM/spades_3.15.5.zip
#Install HUMAnN3.0 - functional profiling
RUN wget -P programs_AM/ https://github.com/biobakery/humann/archive/refs/heads/master.zip
RUN unzip programs_AM/master.zip
#Install Piecrust - functional profiling
#RUN wget -P programs_AM/ https://github.com/picrust/picrust2/archive/refs/tags/v2.5.2.zip
#RUN unzip programs_AM/v2.5.2.zip
#Install bowtie

#install FastQC
RUN wget -P programs_AM/ https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.12.1.zip
RUN unzip programs_AM/fastqc_v0.12.1.zip


#install KneadData
RUN git clone https://github.com/biobakery/kneaddata.git
#RUN cd kneaddata
RUN python3 kneaddata/setup.py install
#RUN pip install kneaddata
#install conda
#ENV CONDA_DIR /opt/conda
#RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
#/bin/bash ~/miniconda.sh -b -p /opt/conda
#ENV PATH=$CONDA_DIR/bin:$PATH
#RUN conda config --set channel_priority false
#RUN conda update --all --yes
#RUN conda create --name metaphlan4 -c bioconda python=3.7.2 metaphlan=4.0.1
#Install metaphlan
#RUN conda install -c bioconda metaphlan 
#RUN conda create --name mpa -c bioconda python=3.7 metaphlan
#RUN conda install -c conda-forge -c bioconda metaphlan
#RUN conda create --name mpa -c conda-forge -c bioconda python=3.7 metaphlan
#RUN conda activate mpa
#RUN command
#RUN pip install metaphlan
#RUN git clone https://github.com/biobakery/MetaPhlAn.git
#RUN pip install .
#RUN metaphlan --install 

#moves shell scripts out into main directory for ease of calling
RUN mv MetagenomeProcessing/runTrimmomatic.sh runTrimmomatic.sh
RUN mv Trimmomatic-0.39/adapters/TruSeq3-PE.fa TruSeq3-PE.fa  

#package manager manipulations

#changes to home directory
RUN cd ../..

#Cleans imported stuff for smaller image
RUN apt-get clean 
#\&& rm -rf /tmp/downloaded_packages/* \
#&& rm -rf /var/lib/apt/lists/*