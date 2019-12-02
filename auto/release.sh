#!/usr/bin/env bash

git tag -d release-vdev
git push origin :release-vdev
git push aliyun :release-vdev

git tag release-vdev
git push origin release-vdev
git push aliyun release-vdev
