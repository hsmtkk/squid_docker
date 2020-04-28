FROM hsmtkk/openssl_docker:1.1.1g as builder

RUN yum -y update \
 && yum install gcc gcc-c++ make perl

WORKDIR /usr/local/src

RUN curl -L -O http://www.squid-cache.org/Versions/v4/squid-4.11.tar.xz \
 && tar fx squid-4.11.tar.xz \
 && cd squid-4.11 \
 && ./configure --prefix=/usr/local --enable-ssl-crtd --with-openssl \
 && make \
 && make install

RUN rm -rf /usr/local/src/*
 
FROM hsmtkk/openssl_docker:1.1.1g

COPY --from=builder /usr/local /usr/local

COPY ./squid.conf /usr/local/etc/squid.conf

RUN /usr/local/sbin/squid -v

EXPOSE 8000

ENTRYPOINT ["/usr/local/sbin/squid", "-N"]
