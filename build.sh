#!/bin/sh
set -e
export DOCKER_BUILDKIT=1
for n in ubuntu_build-20.04 openssl_build-1.1.1g squid_build-4.12 squid_build-5.0.3 squid-5.0.3 squid_build-latest squid-4.12 squid-5.0.3 squid-latest
do
  cd $n
    docker build --tag hsmtkk/squid_docker:$n .
  cd ..
done

