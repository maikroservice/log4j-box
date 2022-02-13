FROM python:slim-buster
LABEL maintainer="20245897+maikroservice@users.noreply.github.com"

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN pip install --upgrade pip


COPY ./ /app
RUN chmod 0755 /app

RUN addgroup --system appgroup 
RUN adduser appuser
RUN adduser appuser appgroup
RUN mv /app /home/appuser/
USER appuser

WORKDIR /home/appuser/app
RUN pip install -r requirements.txt
EXPOSE 8080
ENTRYPOINT [ "python" ]

CMD [ "app.py" ]