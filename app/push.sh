#!/bin/bash

# Read environment vars
. .env

# Push image to docker hub
docker login --username=$DOCKER_USER --password=$DOCKER_PASS
docker tag spottask_app $DOCKER_TAG
docker push $DOCKER_TAG
