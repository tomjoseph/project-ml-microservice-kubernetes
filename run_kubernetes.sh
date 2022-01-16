#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=tjoseph2020/tj-app

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run tj-app --image=tjoseph2020/tj-app --port=80

# Step 3:
# List kubernetes pods
kubectl wait --for=condition=ready pods/tj-app
kubectl get po -A

# Step 4:
# Forward the container port to a host
kubectl port-forward tj-app 8000:80
