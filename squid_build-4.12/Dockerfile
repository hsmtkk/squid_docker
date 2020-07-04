FROM hsmtkk/squid_docker:openssl_build-1.1.1g

WORKDIR /usr/local/src

RUN curl -O http://www.squid-cache.org/Versions/v4/squid-4.12.tar.xz \
 && tar fx squid-4.12.tar.xz

WORKDIR /usr/local/src/squid-4.12

RUN ./configure --prefix=/usr/local/squid --enable-ssl-crtd --disable-optimizations --with-openssl=/usr/local/openssl \
 && make \
 && make install

WORKDIR /usr/local/src

RUN rm -rf squid-4.12*

RUN /usr/local/squid/sbin/squid --version

