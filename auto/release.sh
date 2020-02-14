#!/usr/bin/env bash

git tag -d release-vencoder
git tag release-vencoder

# For docker hub.
if [[ $MACOS == YES ]]; then
  sed -i '' "s|^ARG repo=.*$|ARG repo=ossrs/srs:dev|g" Dockerfile
else
  sed -i "s|^ARG repo=.*$|ARG repo=ossrs/srs:dev|g" Dockerfile
fi
git push origin -f release-vencoder

# For aliyun hub.
if [[ $MACOS == YES ]]; then
  sed -i '' "s|^ARG repo=.*$|ARG repo=registry.cn-hangzhou.aliyuncs.com/ossrs/srs:dev|g" Dockerfile
else
  sed -i "s|^ARG repo=.*$|ARG repo=registry.cn-hangzhou.aliyuncs.com/ossrs/srs:dev|g" Dockerfile
fi
git push aliyun -f release-vencoder
