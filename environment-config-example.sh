#!/bin/bash

# environment-config-example.sh
# Example script to configure environment variables for Azure deployment

# Set environment variables
export AZURE_SUBSCRIPTION_ID='your-subscription-id'
export AZURE_RESOURCE_GROUP='my-resource-group'
export AZURE_LOCATION='eastus'
export REDIS_CACHE_NAME='myredis'
export PYTHON_VERSION='3.9'
export DOCKER_REGISTRY='my-registry'
export GITHUB_ACTIONS_TOKEN='your-github-token'

# Function to display environment variables
print_env_vars() {
  echo "Azure Subscription ID: $AZURE_SUBSCRIPTION_ID"
  echo "Azure Resource Group: $AZURE_RESOURCE_GROUP"
  echo "Azure Location: $AZURE_LOCATION"
  echo "Redis Cache Name: $REDIS_CACHE_NAME"
  echo "Python Version: $PYTHON_VERSION"
  echo "Docker Registry: $DOCKER_REGISTRY"
  echo "GitHub Actions Token: $GITHUB_ACTIONS_TOKEN"
}

# Main execution
print_env_vars