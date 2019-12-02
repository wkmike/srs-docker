#!/usr/bin/env bash

git tag -d release-vdev6
git push origin :release-vdev6
git push aliyun :release-vdev6

git tag release-vdev6
git push origin release-vdev6
git push aliyun release-vdev6
