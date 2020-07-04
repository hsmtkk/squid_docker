FROM hsmtkk/squid_docker:openssl_build-1.1.1g

RUN yum -y install ed which

WORKDIR /usr/local/src

RUN curl -L -O http://ftpmirror.gnu.org/libtool/libtool-2.4.6.tar.gz

WORKDIR /usr/local/src/libtool-2.4.6
 
RUN ./configure --prefix=/usr/local/libtool \
 && make \
 && make install

WORKDIR /usr/local/src

RUN rm -rf libtool-2.4.6*

ENV PATH=/usr/local/libtool/bin:/bin:/sbin:/usr/bin:/usr/sbin

RUN curl -L -O https://github.com/squid-cache/squid/archive/v5.zip \
 && unzip v5.zip

WORKDIR /usr/local/src/squid-5

RUN ./bootstrap.sh \
 && ./configure --prefix=/usr/local/squid --enable-ssl-crtd --disable-optimizations --with-openssl=/usr/local/openssl \
 && make \
 && make install

WORKDIR /usr/local/src

RUN rm -rf squid-5 v5.zip

RUN /usr/local/squid/sbin/squid --version

