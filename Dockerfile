FROM resin/rpi-raspbian:wheezy
MAINTAINER Stefan Biermann <sb@ems-solutions.com>

# Install InfluxDB
ENV INFLUXDB_VERSION 0.9.6
ADD src/influxdb_${INFLUXDB_VERSION}_armhf.deb /tmp/influxdb_${INFLUXDB_VERSION}_armhf.dep
RUN dpkg -i /tmp/influxdb_${INFLUXDB_VERSION}_armhf.dep && \
  rm /tmp/influxdb_${INFLUXDB_VERSION}_armhf.dep && \
  rm -rf /var/lib/apt/lists/*

ADD src/config.toml /config/config.toml
ADD src/run.sh /run.sh
RUN chmod +x /*.sh

ENV PRE_CREATE_DB **None**
ENV SSL_SUPPORT **False**
ENV SSL_CERT **None**

# Admin server
EXPOSE 8083

# HTTP API
EXPOSE 8086

# Raft port (for clustering, don't expose publicly!)
#EXPOSE 8090

# Protobuf port (for clustering, don't expose publicly!)
#EXPOSE 8099

VOLUME ["/data"]

CMD ["/run.sh"]

