FROM linuxserver/baseimage

MAINTAINER Sparklyballs <sparklyballs@liunxserver.io>

ENV APTLIST="nodejs npm git-core"

# install packages
RUN apt-get update -q && \
apt-get install $APTLIST -qy && \

# cleanup
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# install yifypop
RUN git clone https://github.com/yify-pop/yify-pop /app/yifypop && \
cd /app/yifypop && \
npm -g install geddy peerflix && \
npm install
