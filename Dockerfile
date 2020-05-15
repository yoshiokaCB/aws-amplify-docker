FROM node:10-jessie-slim

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

COPY ./entrypoint.sh /
RUN pip install awscli; \
    npm install -g @aws-amplify/cli; \
    mkdir /root/.aws; \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

