#!/bin/bash

set -e

if [[ -n "$ELASTICSEARCH_HOST" ]]
then
  sed 's/\"elasticsearch\"/'"${ELASTICSEARCH_HOST}"'/g' /logstash.conf.template > /logstash.conf
else
  cp /logstash.conf.template /logstash.conf
fi

cd /logstash

/logstash/bin/logstash -f /logstash.conf # --debug
