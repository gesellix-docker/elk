FROM node:0.10.31
MAINTAINER Tobias Gesellchen <tobias@gesellix.de>

ADD ./package.json /kibana/package.json
ADD ./index.js /kibana/index.js
WORKDIR /kibana
RUN npm install

RUN mkdir -p /kibana/ \
    && curl -X GET "https://download.elasticsearch.org/kibana/kibana/kibana-3.1.0.tar.gz" -o /kibana/kibana.tgz \
    && tar xfz /kibana/kibana.tgz -C /kibana && rm /kibana/kibana.tgz \
    && mv kibana-3.1.0 kibana

EXPOSE 9292

CMD ["npm", "start"]
