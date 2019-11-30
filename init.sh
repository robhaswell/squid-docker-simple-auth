#!/bin/sh
htpasswd -bc /etc/squid/squid_passwd "${SQUID_USERNAME}" "${SQUID_PASSWORD}"
exec squid3 -N $*
