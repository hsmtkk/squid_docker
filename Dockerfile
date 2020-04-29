FROM hsmtkk/openssl:1.1.1g as builder

RUN apt -y update \
 && apt -y install curl gcc g++ make perl xz-utils

WORKDIR /usr/local/src

RUN curl -L -O http://www.squid-cache.org/Versions/v4/squid-4.11.tar.xz \
 && tar fx squid-4.11.tar.xz \
 && cd squid-4.11 \
 && ./configure --prefix=/usr/local/squid --enable-ssl-crtd --with-openssl=/usr/local/openssl \
 && make \
 && make install

FROM hsmtkk/openssl:1.1.1g

COPY --from=builder /usr/local/squid /usr/local/squid

RUN env LD_LIBRARY_PATH=/usr/local/openssl/lib /usr/local/squid/sbin/squid -v

EXPOSE 8000
