#!/bin/sh
set -ex

REDMINE_VERSION=6.0.6-alpine

docker build \
    --build-arg REDMINE_VERSION=${REDMINE_VERSION} \
    --no-cache --progress=plain -t krautsalad/redmine:latest -f docker/Dockerfile .
docker push krautsalad/redmine:latest

VERSION=$(git describe --tags "$(git rev-list --tags --max-count=1)")

docker tag krautsalad/redmine:latest krautsalad/redmine:${VERSION}
docker push krautsalad/redmine:${VERSION}
