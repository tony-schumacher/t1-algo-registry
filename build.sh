#!/bin/bash

# Check if a tag is provided
if [ "$#" -ne 2 ] || [ "$1" != "--tag" ]; then
  echo "Usage: $0 --tag {my-tag}"
  exit 1
fi

# Extract the tag value
TAG=$2

# Navigate to the models directory and build the Docker image in the background
(cd ../t1-models && docker build -t teclead/t1-model:dev_${TAG} -f api/dockerfile.models .) &

# Navigate to the m7 directory and build the Docker image in the background
(cd ../m7 && docker build -t teclead/t1-m7:dev_${TAG} .) &

# Wait for all background jobs to finish
wait

echo "Docker images built successfully."
