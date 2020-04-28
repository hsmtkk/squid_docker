#!/bin/sh
tail -F /usr/local/var/logs/access.log &
/usr/local/sbin/squid -N -f /usr/local/etc/squid.conf
