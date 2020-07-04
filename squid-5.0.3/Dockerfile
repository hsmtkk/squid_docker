FROM hsmtkk/squid_docker:openssl_build-1.1.1g as openssl

FROM hsmtkk/squid_docker:squid_build-5.0.3 as squid

FROM ubuntu:20.04

COPY --from=openssl /usr/local/openssl /usr/local/openssl
COPY --from=squid /usr/local/squid /usr/local/squid

RUN echo /usr/local/openssl/lib > /etc/ld.so.conf.d/openssl.conf \
 && ldconfig

RUN /usr/local/squid/sbin/squid --version

EXPOSE 3128

ENTRYPOINT ["/entrypoint.sh"]
