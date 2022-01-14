FROM alpine:3.15.0


RUN apk add wget

RUN apk add --no-cache tar

RUN adduser -D app
RUN mkdir /home/app/log4j
WORKDIR /home/app/log4j

RUN wget https://github.com/apache/trafficcontrol/releases/download/RELEASE-6.0.1/apache-trafficcontrol-6.0.1.tar.gz

RUN tar -xzvf apache-trafficcontrol-6.0.1.tar.gz

USER app
