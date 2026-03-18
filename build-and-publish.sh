#!/bin/sh
set -ex

REDMINE_VERSION=6.1.2-alpine

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
VERSION=$(git describe --tags "$(git rev-list --tags --max-count=1)")

BUILD_CONTEXT="${SCRIPT_DIR}/"

docker buildx build \
--build-arg REDMINE_VERSION=${REDMINE_VERSION} \
--no-cache \
--platform linux/amd64,linux/arm64 \
--progress=plain \
-f "${SCRIPT_DIR}/docker/Dockerfile" \
-t krautsalad/redmine:latest \
-t krautsalad/redmine:${VERSION} \
"${BUILD_CONTEXT}"

until docker buildx build \
    --build-arg REDMINE_VERSION=${REDMINE_VERSION} \
    --platform linux/amd64,linux/arm64 \
    --push \
    -f "${SCRIPT_DIR}/docker/Dockerfile" \
    -t krautsalad/redmine:latest \
    -t krautsalad/redmine:${VERSION} \
    "${BUILD_CONTEXT}"; do
    echo "Retrying push for krautsalad/redmine…" ; sleep 2
done
