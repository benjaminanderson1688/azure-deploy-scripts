#!/bin/bash

# deploy-azure.sh
# Script to deploy application to Azure using environment variables

# Check if environment variables are set
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID is not set."
  exit 1
fi

if [ -z "$AZURE_RESOURCE_GROUP" ]; then
  echo "Error: AZURE_RESOURCE_GROUP is not set."
  exit 1
fi

# Authenticate with Azure
az login --identity

# Set Azure subscription
az account set --subscription "$AZURE_SUBSCRIPTION_ID"

# Create resource group if it does not exist
az group create --name "$AZURE_RESOURCE_GROUP" --location "$AZURE_LOCATION" || true

# Deploy Redis cache
az redis create 
  --name "$REDIS_CACHE_NAME" 
  --resource-group "$AZURE_RESOURCE_GROUP" 
  --location "$AZURE_LOCATION" 
  --sku Basic 
  --https-only off 
  --enable-NonEviction 
  --tags "Environment=dev"

# Build and push Docker image
docker build -t myapp:$PYTHON_VERSION -f Dockerfile .
docker tag myapp:$PYTHON_VERSION $DOCKER_REGISTRY/myapp:$PYTHON_VERSION
docker push $DOCKER_REGISTRY/myapp:$PYTHON_VERSION

# Output deployment status
echo "Deployment completed successfully!"

# Example: Run GitHub Actions workflow manually (if needed)
# gh workflow run deploy.yml