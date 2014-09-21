FROM golang:1.3

RUN git clone https://github.com/elasticsearch/logstash-forwarder.git /logstash-forwarder \
    && cd /logstash-forwarder \
    && go build \
    && chmod +x /logstash-forwarder/logstash-forwarder

RUN ls -lisah /logstash-forwarder

CMD ["ls", "-lisah", "/logstash-forwarder"]
