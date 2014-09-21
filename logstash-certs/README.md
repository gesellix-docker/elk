Zertifikat generiert per:

`openssl req -x509 -batch -nodes -newkey rsa:2048 -keyout logstash.key -out logstash.crt -days 360000`

Zertifikat-Details anzeigbar per:

`openssl x509 -in logstash.crt -text`

Siehe [GitHub](https://github.com/elasticsearch/logstash-forwarder/issues/5) zum Thema Zertifikat im Logstash-Forwarder.
Bis auf Weiteres wird SSL nicht optional sein.
