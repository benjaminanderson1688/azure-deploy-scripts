#!/bin/bash
# backup-redis.sh - Backup Redis data to Azure Blob Storage

# Configuration
AZURE_STORAGE_ACCOUNT="your-azure-storage-account"
AZURE_STORAGE_KEY="your-azure-storage-key"
CONTAINER_NAME="redis-backups"
LOCAL_BACKUP_DIR="/tmp/redis-backups"

# Create local backup directory if it doesn't exist
mkdir -p $LOCAL_BACKUP_DIR

cd $LOCAL_BACKUP_DIR

# Dump Redis data to a file
redis-cli -h redis-host -p 6379 -a redis-password BGSAVE

# Wait for the dump to complete
dump_file=$(redis-cli -h redis-host -p 6379 -a redis-password LASTSAVE)
while [ $(redis-cli -h redis-host -p 6379 -a redis-password LASTSAVE) -eq $dump_file ]; do
  sleep 1
done

dump_file=$(find . -name "dump.rdb" -type f | sort -r | head -n1)

# Upload the backup to Azure Blob Storage
az storage blob upload --account-name $AZURE_STORAGE_ACCOUNT --account-key $AZURE_STORAGE_KEY 
  --container-name $CONTAINER_NAME --file $dump_file --name "redis-$(date +%Y%m%d-%H%M).rdb"

# Clean up local backup
cd && rm -rf $LOCAL_BACKUP_DIR

# End of script