FROM linuxserver/baseimage.node

MAINTAINER Sparklyballs <sparklyballs@liunxserver.io>

ENV APTLIST="python"

# install packages
RUN add-apt-repository ppa:fkrull/deadsnakes-python2.7 && \
apt-get update && \
apt-get install $APTLIST -qy && \
apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/*


# install yifypop
RUN git clone https://github.com/yify-pop/yify-pop /app/yifypop && \
cd /app/yifypop && \
npm -g install geddy peerflix && \
npm install
