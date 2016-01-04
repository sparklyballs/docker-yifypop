FROM linuxserver/baseimage

MAINTAINER Sparklyballs <sparklyballs@liunxserver.io>

ENV APTLIST="build-essential git-core"

# install packages
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash - && \
apt-get install $APTLIST -qy && \

# build node
curl -o /tmp/nodebinary.tar.gz -L https://nodejs.org/dist/v4.2.4/node-v4.2.4-linux-x64.tar.gz && \
mkdir -p /tmp/nodesource && \
tar xvf /tmp/nodebinary.tar.gz -C /tmp/nodesource --strip-components=1 && \
cd /tmp/nodesource && \
./configure && \
make && \
make install && \

# cleanup
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# install yifypop
RUN git clone https://github.com/yify-pop/yify-pop /app/yifypop && \
cd /app/yifypop && \
npm -g install geddy peerflix && \
npm install
