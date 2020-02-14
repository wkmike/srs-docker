#!/usr/bin/env bash

# For docker hub.
if [[ $MACOS == YES ]]; then
  sed -i '' "s|^ARG repo=.*$|ARG repo=ossrs/srs:dev|g" Dockerfile
else
  sed -i "s|^ARG repo=.*$|ARG repo=ossrs/srs:dev|g" Dockerfile
fi

git commit -am "Release encoder to docker hub"; git push
git tag -d release-vencoder
git tag release-vencoder
git push origin -f release-vencoder

# For aliyun hub.
if [[ $MACOS == YES ]]; then
  sed -i '' "s|^ARG repo=.*$|ARG repo=registry.cn-hangzhou.aliyuncs.com/ossrs/srs:dev|g" Dockerfile
else
  sed -i "s|^ARG repo=.*$|ARG repo=registry.cn-hangzhou.aliyuncs.com/ossrs/srs:dev|g" Dockerfile
fi

git commit -am "Release encoder to aliyun hub"; git push
git tag -d release-vencoder
git tag release-vencoder
git push aliyun -f release-vencoder
