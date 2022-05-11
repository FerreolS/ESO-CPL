FROM ubuntu
LABEL maintainer "Ferreol Soulez <ferreol.soulez@univ-lyon1.fr>"
RUN apt-get update && apt-get -y install m4 automake pkg-config libtool git wget zip automake make tar fftw3-dev  &&\
wget https://github.com/liberfa/erfa/archive/refs/heads/master.zip && \
unzip master.zip && cd  erfa-master && ./bootstrap.sh && \
./configure --disable-dependency-tracking && make && make install && cd .. &&\
wget https://ftp.eso.org/pub/dfs/pipelines/libraries/cfitsio/cfitsio-3.49.tar.gz && \
tar -xvzf cfitsio-3.49.tar.gz && cd cfitsio-3.49 && ./configure  --prefix=/usr/local  --enable-shared  --enable-reentrant &&\
make && make shared && make install && cd .. &&\
wget https://ftp.eso.org/pub/dfs/pipelines/libraries/wcslib/wcslib-7.6.tar.bz2 && mkdir -p /usr/local/share/man/man1 &&\ 
tar -xvjf wcslib-7.6.tar.bz2 && cd wcslib-7.6 && ./configure && make && make install && cd .. &&\
wget https://ftp.eso.org/pub/dfs/pipelines/libraries/cpl/cpl-7.1.4.tar.gz && tar -xvzf cpl-7.1.4.tar.gz  &&\
cd cpl-7.1.4 &&  ./configure  --with-fftw-libs=/usr && make && make install
ENTRYPOINT bash
