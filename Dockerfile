FROM ubuntu:18.04
LABEL maintainer="Rob Haswell <me@robhaswell.co.uk>"

RUN apt-get -y update && \
    apt-get -y upgrade &&\
    apt-get install -y apache2-utils squid && \
    rm -rf /var/lib/apt/lists/*
COPY squid.conf /etc/squid/squid.conf
COPY init.sh /
EXPOSE 3128

CMD ["/bin/bash", "/init.sh"]
