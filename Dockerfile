FROM node:16-buster-slim

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive
RUN set -eux; \
    apt-get update -y && \
    apt-get install -y --no-install-recommends \
    python python-pip wget software-properties-common apt-transport-https gnupg \
    ; \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN wget -O- https://apt.corretto.aws/corretto.key | apt-key add -; \
    add-apt-repository 'deb https://apt.corretto.aws stable main'; \
    mkdir -p /usr/share/man/man1; \
    apt-get update; apt-get install -y java-1.8.0-amazon-corretto-jdk \
    ; \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND dialog

COPY ./entrypoint.sh /
RUN pip install awscli; \
    npm install -g @aws-amplify/cli; \
    mkdir /root/.aws; \
    chmod +x /entrypoint.sh
WORKDIR /usr/src

ENTRYPOINT ["/entrypoint.sh"]
