#!/bin/bash

set -e

docker build -t kibana .
docker run -d -p 9292:9292 --name kibana kibana
