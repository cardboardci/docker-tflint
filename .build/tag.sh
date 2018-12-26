#!/bin/sh
echo "Pulling the image from the Registry"
docker pull "$CI_REGISTRY_IMAGE:$CI_COMMIT_REF_SLUG"

