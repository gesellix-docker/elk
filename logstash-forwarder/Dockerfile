FROM ubuntu:14.04
MAINTAINER Tobias Gesellchen <tobias@gesellix.de>

VOLUME /logs

ADD ./logstash.crt /logstash-certs/logstash.crt
ADD ./logstash-forwarder /logstash-forwarder/logstash-forwarder

ADD ./logstash-forwarder.conf.template /
ADD ./start-logstash-forwarder.sh /

CMD ["/start-logstash-forwarder.sh"]
