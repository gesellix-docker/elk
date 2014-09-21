#!/bin/bash

docker build -t logstash-forwarder-builder .
docker rm logstash-forwarder-binary 2> /dev/null
docker run --name logstash-forwarder-binary logstash-forwarder-builder
docker cp logstash-forwarder-binary:/logstash-forwarder/logstash-forwarder .
chmod +x ./logstash-forwarder
