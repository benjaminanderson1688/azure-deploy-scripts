#!/bin/bash
# restore-redis.sh - Restore Redis data from Azure Blob Storage

# Configuration
AZURE_STORAGE_ACCOUNT="your-azure-storage-account"
AZURE_STORAGE_KEY="your-azure-storage-key"
CONTAINER_NAME="redis-backups"
LOCAL_BACKUP_DIR="/tmp/redis-backups"

# Create local backup directory if it doesn't exist
mkdir -p $LOCAL_BACKUP_DIR

cd $LOCAL_BACKUP_DIR

# Fetch the latest backup file from Azure Blob Storage
latest_blob=$(az storage blob list --account-name $AZURE_STORAGE_ACCOUNT --account-key $AZURE_STORAGE_KEY 
  --container-name $CONTAINER_NAME --query "[?contains(name, 'redis-')].name" --output tsv | sort -r | head -n1)

# Download the latest backup file
az storage blob download --account-name $AZURE_STORAGE_ACCOUNT --account-key $AZURE_STORAGE_KEY 
  --container-name $CONTAINER_NAME --name $latest_blob --file $latest_blob

# Stop Redis service to avoid data inconsistency
sudo systemctl stop redis

# Replace the Redis data file with the backup
sudo mv $latest_blob /var/lib/redis/dump.rdb

# Start Redis service
sudo systemctl start redis

# Clean up local backup
cd && rm -rf $LOCAL_BACKUP_DIR

# End of script