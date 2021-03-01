#!/usr/bin/env bash

if [ ! "$2" ]; then
  echo "Error: you should pass API_VERSION version number and BUILD_NUMBER as params"
else
  yarn version --no-git-tag-version --new-version "$1.$2"
  sed -i.bak -E 's!([0-9]+\.[0-9]+)!'"$1"'!' -- README.md && rm -- README.md.bak
fi
