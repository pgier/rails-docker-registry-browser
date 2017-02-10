
docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD";
if [ "$TRAVIS_TAG" ]; then
    DOCKER_TAG="${DOCKER_IMAGE_NAME}:${TRAVIS_TAG}"
    docker tag "${DOCKER_IMAGE_NAME}:latest" "${DOCKER_TAG}"
    docker push "${DOCKER_TAG}"
else
    DOCKER_TAG="${DOCKER_IMAGE_NAME}:${TRAVIS_COMMIT::8}"
    docker tag "${DOCKER_IMAGE_NAME}:latest" "${DOCKER_TAG}"
    docker push "${DOCKER_TAG}"
fi

