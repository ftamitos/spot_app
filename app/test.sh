#!/bin/bash

# Run project
docker-compose up --build -d
sleep 5

# Query results
if [ -n $(docker ps -q) ]
then
  curl 127.0.0.1:5000/secret/ | jq '.secret_code'
  curl 127.0.0.1:5000/health/ | jq '.'
fi

# Destroy 
docker-compose down
