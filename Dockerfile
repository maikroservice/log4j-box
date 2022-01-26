FROM openjdk:8u181-jdk-alpine


RUN apk add --no-cache wget tar bash

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser
WORKDIR /home/appuser
RUN wget https://archive.apache.org/dist/lucene/solr/8.11.0/solr-8.11.0.tgz
RUN tar -xvf solr-8.11.0.tgz
WORKDIR /home/appuser/solr-8.11.0/bin/
RUN ls
EXPOSE 8983
RUN ./solr start -p 8983