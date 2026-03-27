#!/bin/bash
# environment-config-example.sh
# This script sets up environment variables for Azure deployment with Redis and Python services.

# Set Azure credentials
export AZURE_SUBSCRIPTION_ID='your-subscription-id'
export AZURE_CLIENT_ID='your-client-id'
export AZURE_CLIENT_SECRET='your-client-secret'
export AZURE_TENANT_ID='your-tenant-id'

# Set Redis configuration
export REDIS_HOST='redis-instance.redis.cache.windows.net'
export REDIS_PORT=6380
export REDIS_PASSWORD='your-redis-password'

# Set Python service configuration
export PYTHON_SERVICE_NAME='python-service'
export PYTHON_IMAGE='python:3.9-slim'
export PYTHON_CONTAINER_PORT=5000
export PYTHON_API_PORT=80

# Set GitHub Actions secrets (for CI/CD)
export GITHUB_ACTIONS_SECRET_NAME='azure-deploy-key'
export GITHUB_ACTIONS_SECRET_VALUE='your-deploy-key'

# Set Docker registry credentials
export DOCKER_REGISTRY='your-registry-url'
export DOCKER_USERNAME='your-username'
export DOCKER_PASSWORD='your-password'

# Set Azure Redis Cache name
export REDIS_CACHE_NAME='redis-instance'

# Set Azure resource group
export RESOURCE_GROUP='azure-deploy-resources'

# Set Python service deployment settings
export DEPLOYMENT_LOCATION='eastus'
export PYTHON_ENVIRONMENT='production'

# Output environment variables for verification
env | grep 'AZURE\|REDIS\|PYTHON\|GITHUB\|DOCKER\|RESOURCE'