#!/bin/bash

docker build -t elasticsearch .
docker rm elasticsearch
docker run -d -p 9200:9200 -p 9300:9300 --name elasticsearch elasticsearch
