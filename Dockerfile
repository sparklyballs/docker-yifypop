FROM linuxserver/baseimage

MAINTAINER Sparklyballs <sparklyballs@liunxserver.io>

ENV APTLIST="build-essential nodejs git-core"

# install packages
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash - && \
apt-get install $APTLIST -qy && \
npm install -g npm@latest && \

# cleanup
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# install yifypop
RUN git clone https://github.com/yify-pop/yify-pop /app/yifypop && \
cd /app/yifypop && \
npm -g install geddy peerflix && \
npm install
