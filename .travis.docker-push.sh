
docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD";
if [ "$TRAVIS_TAG" ]; then
    docker push ${DOCKER_IMAGE_NAME}:${TRAVIS_TAG};
else
    docker push ${DOCKER_IMAGE_NAME}:${TRAVIS_COMMIT::8};
fi

