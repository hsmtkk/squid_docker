FROM hsmtkk/squid_docker:openssl_build-1.1.1g

WORKDIR /usr/local/src

RUN curl -L -O https://github.com/squid-cache/squid/archive/v5.zip \
 && unzip v5.zip

WORKDIR /usr/local/src/squid-5

RUN ./configure --prefix=/usr/local/squid --enable-ssl-crtd --disable-optimizations --with-openssl=/usr/local/openssl \
 && make \
 && make install

RUN /usr/local/squid/sbin/squid --version
