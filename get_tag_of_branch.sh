#!/bin/bash

cd srs &&
git checkout $1 &&
commit=`git rev-parse --verify refs/remotes/origin/$1` &&
git describe --tags $commit
