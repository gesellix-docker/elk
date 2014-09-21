FROM java:8
MAINTAINER Tobias Gesellchen <tobias@gesellix.de>

EXPOSE 9200
EXPOSE 9300

VOLUME /elasticsearch-data

ENV ES_VERSION 1.3.2
#ENV ES_VERSION 0.90.3

RUN cd / \
    && echo "installing elasticsearch ${ES_VERSION}" \
    && curl -X GET "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${ES_VERSION}.tar.gz" -o /tmp/es.tgz \
    && tar xfz /tmp/es.tgz -C /tmp \
    && rm /tmp/es.tgz \
    && mv /tmp/elasticsearch-${ES_VERSION} /elasticsearch

ADD ./elasticsearch.yml /elasticsearch/config/elasticsearch.yml

#RUN /elasticsearch/bin/plugin -install elasticsearch/elasticsearch-river-couchdb/1.3.0

WORKDIR /elasticsearch

CMD ["/elasticsearch/bin/elasticsearch"]
