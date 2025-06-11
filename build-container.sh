#!/bin/sh
set -ex
docker build --no-cache --progress=plain -t krautsalad/redmine:latest -f Dockerfile .
