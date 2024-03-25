#!/bin/bash

# Check if a tag is provided
if [ "$#" -ne 2 ] || [ "$1" != "--tag" ]; then
  echo "Usage: $0 --tag {my-tag}"
  exit 1
fi

# Extract the tag value
TAG=$2

# Navigate to the models directory and build the Docker image
cd ../t1-models && docker build -t teclead/t1-model:${TAG} -f api/dockerfile.models .

# Navigate to the m7 directory and build the Docker image
cd ../m7 && docker build -t teclead/t1-m7:${TAG} .

echo "Docker images built successfully."
