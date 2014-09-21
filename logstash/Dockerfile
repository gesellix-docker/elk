FROM java:8
MAINTAINER Tobias Gesellchen <tobias@gesellix.de>

#RUN apt-get update && apt-get install -y curl
RUN curl -X GET "https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz" -o /logstash.tgz \
    && tar xfz /logstash.tgz -C / \
    && rm /logstash.tgz \
    && mv /logstash-1.4.2 /logstash

RUN mkdir -p /logstash-certs
ADD ./logstash.crt /logstash-certs/logstash.crt
ADD ./logstash.key /logstash-certs/logstash.key

ADD ./logstash.conf.template /logstash.conf.template
ADD ./start-logstash.sh /start-logstash.sh

EXPOSE 5043

CMD ["/start-logstash.sh"]
