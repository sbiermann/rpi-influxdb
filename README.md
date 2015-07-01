rpi-influxdb
This project is based on [tutum/influxdb](https://github.com/tutumcloud/influxdb) 

InfluxDB image

Usage
-----

To create the image `sbiermann/influxdb`, execute the following command on rpi-influxdb folder:

    docker build -t sbiermann/influxdb .

You can now push new image to the registry:

    docker push sbiermann/influxdb
    
Tags
----

    sbiermann/influxdb:latest -> influxdb 0.9
    sbiermann/influxdb:0.9.0    -> influxdb 0.9

Running your InfluxDB image
--------------------------

Start your image binding the external ports `8083` and `8086` in all interfaces to your container. Ports `8090` and `8099` are only used for clustering and should not be exposed to the internet.

    docker run -d -p 8083:8083 -p 8086:8086 sbiermann/influxdb


Configuring your InfluxDB
-------------------------
Open your browse to access `localhost:8083` to configure InfluxDB. Fill the port which maps to `8086`. The default credential is `root:root`. Please change it as soon as possible.

Alternatively, you can use RESTful API to talk to InfluxDB on port `8086`


Initially create Database
-------------------------
Use `-e PRE_CREATE_DB="db1;db2;db3"` to create database named "db1", "db2", and "db3" on the first time the container starts automatically. Each database name is separated by `;`. For example:

```docker run -d -p 8083:8083 -p 8084:8084 -e PRE_CREATE_DB="db1;db2;db3" sbiermann/influxdb:latest```
