FROM python:3.7-alpine

WORKDIR /app

RUN set -ex \
	&& apk add --no-cache --virtual .fetch-deps \
    bash

COPY requirements.txt /tmp/
RUN pip install --upgrade pip \
    && pip install -r /tmp/requirements.txt \
    && rm -f /tmp/requirements.txt

EXPOSE 8000

ENTRYPOINT ["./entrypoint.sh"]
CMD ["server"]
