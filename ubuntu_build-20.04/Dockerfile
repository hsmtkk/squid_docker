FROM hsmtkk/squid_docker:ubuntu-20.04

RUN apt-get -y --no-install-recommends install build-essential=12.8ubuntu1 \
 autoconf=2.69-11.1 \
 automake=1:1.16.1-4ubuntu6 \
 curl=7.68.0-1ubuntu2.1 \
 ed=1.16-1 \ 
 libtool=2.4.6-14 \ 
 libtool-bin=2.4.6-14 \
 unzip=6.0-25ubuntu1 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

