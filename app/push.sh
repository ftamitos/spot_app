#!/bin/bash

# Push image to docker hub
docker login --username=$DOCKER_USER
docker tag spottask_app $DOCKER_TAG
docker push $DOCKER_TAG
