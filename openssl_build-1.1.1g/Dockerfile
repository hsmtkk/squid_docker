FROM hsmtkk/squid_docker:ubuntu_build-20.04

WORKDIR /usr/local/src

RUN curl -O https://www.openssl.org/source/openssl-1.1.1g.tar.gz \
 && tar fxz openssl-1.1.1g.tar.gz

WORKDIR /usr/local/src/openssl-1.1.1g

RUN ./config --prefix=/usr/local/openssl shared \
 && make \
 && make install_sw

WORKDIR /usr/local/src

RUN rm -rf openssl-1.1.1g*

RUN echo /usr/local/openssl/lib > /etc/ld.so.conf.d/openssl.conf \
 && ldconfig

RUN /usr/local/openssl/bin/openssl version

