#!/bin/sh

set -e

if [ -d /tmp/init.d ]; then
  for file in /tmp/init.d/*; do
    . $file
  done
fi

if [ -n "$GITHUB_SSH_KEY" ]; then
  SSH_DIR=/root/.ssh
  echo "$GITHUB_SSH_KEY" > $SSH_DIR/github.key
  chmod 600 $SSH_DIR/github.key
fi

if [ -n "$GIT_PROJECT" ]; then
  git clone $GIT_PROJECT /work/project
fi

exec "$@"
