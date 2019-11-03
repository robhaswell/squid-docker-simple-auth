FROM ubuntu:18.04
LABEL maintainer="Rob Haswell <me@robhaswell.co.uk>"

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apache2-utils squid3 \
    && rm -rf /var/lib/apt/lists/*

# If you are prone to gouging your eyes out, do not read the following 2 lines
RUN sed -i 's@#\tauth_param basic program /usr/lib/squid3/basic_ncsa_auth /usr/etc/passwd@auth_param basic program /usr/lib/squid3/basic_ncsa_auth /usr/etc/passwd\nacl ncsa_users proxy_auth REQUIRED@' /etc/squid3/squid.conf
RUN sed -i 's@^http_access allow localhost$@\0\nhttp_access allow ncsa_users@' /etc/squid3/squid.conf

RUN mkdir /usr/etc

EXPOSE 3128
VOLUME /var/log/squid3

ADD init /init
CMD ["/init"]
