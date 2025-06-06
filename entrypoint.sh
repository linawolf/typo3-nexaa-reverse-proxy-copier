#!/bin/sh

set -e

if [ -z "$CIDR_RANGE" ]; then
  echo "Error: CIDR_RANGE is not set" >&2
  exit 1
fi

mkdir -p /config/system
envsubst '${CIDR_RANGE}' < /app/additional.php.template > /config/system/additional.php

echo "Config written to /config/system/additional.php with CIDR=$CIDR_RANGE"
