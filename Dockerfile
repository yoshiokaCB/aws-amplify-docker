FROM node:8.16.2-jessie-slim

ENV LANG C.UTF-8

ENV DEBIAN_FRONTEND noninteractive
RUN set -eux; \
  apt-get update -y && \
  apt-get install -y --no-install-recommends \
    python python-pip \
    ; \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND dialog

RUN pip install awscli
RUN npm install -g aws-cdk
RUN mkdir /root/.aws

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

