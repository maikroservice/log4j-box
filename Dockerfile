FROM alpine:3.15.0


RUN apk add wget

RUN apk add --no-cache tar

RUN adduser -D app
USER app

RUN wget https://github.com/apache/trafficcontrol/releases/download/RELEASE-6.0.1/apache-trafficcontrol-6.0.1.tar.gz

RUN tar -xzvf apache-trafficcontrol-6.0.1.tar.gz


