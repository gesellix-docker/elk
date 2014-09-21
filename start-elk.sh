#!/bin/bash

set -ex -o pipefail

PRIVATE_IP=$( ip -4 -s a | grep 'state UP' -A1 | tail -n1 | awk '{print $2}' | cut -f1 -d'/')
export PRIVATE_IP
echo "using '$PRIVATE_IP' for inter-container communication."

BASE_DIR=$( cd "$( dirname "$0" )" && pwd )
echo "using '$BASE_DIR' as... well, base directory."

mkdir -p $BASE_DIR/dist

if [[ ! -r $BASE_DIR/dist/logstash-forwarder ]]
then
  echo "going to build '$BASE_DIR/dist/logstash-forwarder'..."
  cd $BASE_DIR/logstash-forwarder-build
  ./build.sh
  mv $BASE_DIR/logstash-forwarder-build/logstash-forwarder $BASE_DIR/dist/logstash-forwarder
fi

if [[ ! -r $BASE_DIR/dist/logstash/logstash.crt || ! -r $BASE_DIR/dist/logstash/logstash.key ]]
then
  echo "going to build '$BASE_DIR/dist/logstash.{crt,key}'..."
  cd $BASE_DIR/logstash-certs
  ./create.sh
  mv $BASE_DIR/logstash-certs/logstash.crt $BASE_DIR/dist/logstash.crt
  mv $BASE_DIR/logstash-certs/logstash.key $BASE_DIR/dist/logstash.key
fi

cd $BASE_DIR/elasticsearch
./build-and-run.sh

cd $BASE_DIR/logstash
cp $BASE_DIR/dist/logstash.crt .
cp $BASE_DIR/dist/logstash.key .

cd $BASE_DIR/logstash
./build-and-run.sh

cd $BASE_DIR/kibana
./build-and-run.sh

cd $BASE_DIR/logstash-forwarder
cp $BASE_DIR/dist/logstash-forwarder .
cp $BASE_DIR/dist/logstash.crt .
./build.sh

cd $BASE_DIR
docker ps

#docker run -it -v /path/to/logs:/logs --link logstash:logstash logstash-forwarder

