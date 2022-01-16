#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=tjoseph2020/tj-app

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login -u tjoseph2020
docker tag tj-app:latest $dockerpath

# Step 3:
# Push image to a docker repository
docker push $dockerpath