#!/bin/sh

if [ -d /tmp/init.d ]; then
  for file in /tmp/init.d/*; do
    . $file
  done
fi

exec "$@"
