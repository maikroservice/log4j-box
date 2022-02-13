FROM openjdk:8u181-jdk-alpine
LABEL maintainer="20245897+maikroservice@users.noreply.github.com"

RUN apk add --no-cache wget tar bash lsof

COPY docker-entrypoint.sh .
COPY auth/security.json .

RUN chmod 0755 docker-entrypoint.sh
RUN chmod 0755 security.json


RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN mv docker-entrypoint.sh /home/appuser
RUN mv security.json /home/appuser
USER appuser
WORKDIR /home/appuser
RUN wget -q https://archive.apache.org/dist/lucene/solr/8.11.0/solr-8.11.0.tgz -O solr.tgz
RUN tar -xf solr.tgz
RUN mv security.json /home/appuser/solr-8.11.0/server/solr

EXPOSE 8983

ENTRYPOINT ["./docker-entrypoint.sh"]
