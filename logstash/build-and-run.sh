#!/bin/bash

set -e

docker build -t logstash .
docker run -d -p 5043:5043 --name logstash --link elasticsearch:elasticsearch logstash
