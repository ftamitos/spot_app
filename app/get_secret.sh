#!/bin/bash

# Read environment vars
. .env

# Connect to aws
aws configure set aws_access_key_id $AWS_ACCESS
aws configure set aws_secret_access_key $AWS_SECRET
aws configure set default.region $AWS_REGION

# Create folders
mkdir -p ./html/secret
mkdir -p ./html/health

# Extract code from db
aws dynamodb get-item \
  --table-name devops-challenge \
  --key '{ "code_name": { "S": "thedoctor"	} }' \
  > ./html/secret/index.html

# Set health page
echo '{ "container": "'"$DOCKERHUB_LINK"'", "project": "'"$GITHUB_LINK"'", "status": "healthy" }' \
  > ./html/health/index.html
