#!/bin/sh
htpasswd -bc /etc/squid/squid_passwd "${SQUID_USERNAME}" "${SQUID_PASSWORD}"
chown proxy /proc/self/fd/1
exec squid3 -N $*
