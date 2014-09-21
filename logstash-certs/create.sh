#!/bin/bash

docker build -t logstash-certs-creator .
docker rm logstash-certs 2> /dev/null
echo "PRIVATE_IP: '$PRIVATE_IP'"
docker run -it --name logstash-certs logstash-certs-creator
docker cp logstash-certs:/selfsigned.crt .
docker cp logstash-certs:/selfsigned.key .

mv selfsigned.crt logstash.crt
mv selfsigned.key logstash.key
