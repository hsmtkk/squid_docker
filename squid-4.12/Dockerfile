FROM hsmtkk/squid_docker:openssl_build-1.1.1g as openssl

FROM hsmtkk/squid_docker:squid_build-4.12 as squid

FROM ubuntu:20.04

COPY --from=openssl /usr/local/openssl /usr/local/openssl
COPY --from=squid /usr/local/squid /usr/local/squid

RUN echo /usr/local/openssl/lib > /etc/ld.so.conf.d/openssl.conf \
 && ldconfig

RUN apt-get -y update \
 && apt-get -y --no-install-recommends install libltdl7=2.4.6-14 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN /usr/local/squid/sbin/squid --version

EXPOSE 3128

ENTRYPOINT ["/entrypoint.sh"]
