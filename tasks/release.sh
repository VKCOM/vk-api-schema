#!/bin/bash

if [ ! $1 ]; then
  echo "Error: you should pass version number"
else
  echo "[vk-api-schema release]: creating version"
  yarn version --no-git-tag-version --new-version $1

  echo "[vk-api-schema release]: commit"
  git add -A && git commit -m "v$1"

  echo "[vk-api-schema release]: add tag"
  git tag -a "v$1" -m "v$1"

  echo "[vk-api-schema release]: pushing updates"
  git push origin HEAD

  echo "[vk-api-schema release]: pushing new tag"
  git push origin "v$1"
fi
