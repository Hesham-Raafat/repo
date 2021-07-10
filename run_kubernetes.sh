#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="heshamraafat/python:v1"
# Step 2
# Run the Docker Hub container with kubernetes
kubectl run mypod --image=$dockerpath --port=80 --labels="mypod"

# Step 3:
# List kubernetes pods
kubectl get pods -o wide
# Step 4:
# Forward the container port to a host
export mypod=$(kubectl get pod -l mypod -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward $mypod 8000:80
