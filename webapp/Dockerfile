FROM python:slim-buster
LABEL maintainer="20245897+maikroservice@users.noreply.github.com"

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN pip install --upgrade pip



COPY ./ /var/www/localhost/htdocs
RUN chmod 0755 /var/www/localhost/htdocs

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser
WORKDIR /home/appuser

EXPOSE 80