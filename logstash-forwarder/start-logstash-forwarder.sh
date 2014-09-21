#!/bin/bash

if [[ ! -x /logstash-forwarder/logstash-forwarder ]]
then
  echo "'/logstash-forwarder/logstash-forwarder' should exist and be executable"
  exit 1
fi

if [[ ! -r /logstash-certs/logstash.crt ]]
then
  echo "'/logstash-certs/logstash.crt' should be readable"
  exit 1
fi

if [[ -n "$LOGSTASH_HOST" ]]
then
  sed 's/logstash:5043/'"${LOGSTASH_HOST}:5043"'/g' /logstash-forwarder.conf.template > /logstash-forwarder.conf
else
  cp /logstash-forwarder.conf.template /logstash-forwarder.conf
fi

cd /

/logstash-forwarder/logstash-forwarder -config /logstash-forwarder.conf
