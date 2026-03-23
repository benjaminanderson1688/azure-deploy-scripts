#!/bin/bash
set -euo pipefail

APP_NAME="${1:?Usage: deploy-webapp.sh <app-name> <resource-group>}"
RG="${2:?Usage: deploy-webapp.sh <app-name> <resource-group>}"

echo "Deploying $APP_NAME to resource group $RG..."

az webapp up \
  --name "$APP_NAME" \
  --resource-group "$RG" \
  --runtime "PYTHON:3.11" \
  --sku B1

echo "Done. URL: https://$APP_NAME.azurewebsites.net"
