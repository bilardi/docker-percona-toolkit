FROM debian:stable
MAINTAINER Carles Amigó, fr3nd@fr3nd.net

RUN apt-get update && apt-get install -y \
      libdbd-mysql-perl \
      libdbi-perl \
      libio-socket-ssl-perl \
      libterm-readkey-perl \
      perl \
      wget \
      && rm -rf /usr/share/doc/* && \
      rm -rf /usr/share/info/* && \
      rm -rf /tmp/* && \
      rm -rf /var/tmp/*

ENV PERCONA_VERSION 2.2.15
ENV RERELEASE_VERSION 2.2.15-2

WORKDIR /tmp
RUN wget https://www.percona.com/downloads/percona-toolkit/${PERCONA_VERSION}/deb/percona-toolkit_${RERELEASE_VERSION}_all.deb && \
    dpkg -i percona-toolkit_${RERELEASE_VERSION}_all.deb && \
    rm -f percona-toolkit_${RERELASE_VERSION}_all.deb

WORKDIR /
