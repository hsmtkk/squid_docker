FROM hsmtkk/squid_docker:centos_devel-7

WORKDIR /usr/local/src

RUN curl -O https://www.openssl.org/source/openssl-1.1.1g.tar.gz \
 && tar fxz openssl-1.1.1g.tar.gz \
 && cd openssl-1.1.1g \
 && ./config --prefix=/usr/local/openssl shared \
 && make \
 && make install_sw

RUN echo /usr/local/openssl/lib > /etc/ld.so.conf.d/openssl.conf \
 && ldconfig

RUN /usr/local/openssl/bin/openssl version
