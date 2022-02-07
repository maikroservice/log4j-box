FROM openjdk:8u181-jdk-alpine




RUN apk add bash --no-cache

RUN rc-status
RUN echo http://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/main >> /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/community >> /etc/apk/repositories

RUN apk update

RUN export phpverx=$(alpinever=$(cat /etc/alpine-release|cut -d '.' -f1);[ $alpinever -ge 9 ] && echo  7|| echo 5)
RUN apk add --no-cache wget tar bash lsof apache2 php$phpverx-apache2

RUN bash -c "rc-service apache2 start"

COPY docker-entrypoint.sh .
COPY website/ /var/www/localhost/htdocs
RUN chmod 0755 /var/www/localhost/htdocs
RUN chmod 0755 docker-entrypoint.sh



RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN mv docker-entrypoint.sh /home/appuser
USER appuser
WORKDIR /home/appuser
RUN wget -q https://archive.apache.org/dist/lucene/solr/8.11.0/solr-8.11.0.tgz -O solr.tgz
RUN tar -xf solr.tgz

# EXPOSE 8983
EXPOSE 80
#ENTRYPOINT ["./docker-entrypoint.sh"]
