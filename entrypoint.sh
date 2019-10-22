#!/bin/sh
set -e

if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ]; then
  set -- node "$@"
fi

{ \
  echo "[default]"; \
  echo "region = $REGION"; \
  echo "output = $OUTPUT"; \
} | tee /root/.aws/config;

{ \
  echo "[default]"; \
  echo "aws_access_key_id = $AWS_ACCESS_KEY"; \
  echo "aws_secret_access_key = $AWS_SECRET_ACCESS_KEY"; \
} | tee /root/.aws/credentials;

exec "$@"
