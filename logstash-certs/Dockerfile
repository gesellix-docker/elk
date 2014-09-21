FROM golang:1.3

# see https://github.com/elasticsearch/logstash-forwarder/issues/221
#RUN curl -X GET "https://raw.githubusercontent.com/driskell/log-courier/develop/src/lc-tlscert/lc-tlscert.go" -o /lc-tlscert.go

ADD ./lc-tlscert.go /lc-tlscert.go
RUN go build /lc-tlscert.go && mkdir -p /logstash-certs && mv /go/lc-tlscert /logstash-certs/lc-tlscert

WORKDIR /logstash-certs

CMD /logstash-certs/lc-tlscert && cp /logstash-certs/selfsigned.* /
