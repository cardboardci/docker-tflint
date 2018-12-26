#!/bin/sh
echo "Hello World"

docker build --pull -t "$CI_REGISTRY_IMAGE:$CI_COMMIT_REF_SLUG" .
docker push "$CI_REGISTRY_IMAGE"