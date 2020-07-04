#!/bin/sh
set -e
export DOCKER_BUILDKIT=1
for n in centos-7 centos_devel-7 openssl_build-1.1.1g squid-5.0.3 squid_build-5.0.3 squid_build-latest squid-latest
do
  cd $n
    docker build --tag hsmtkk/squid_docker:$n .
  cd ..
done

