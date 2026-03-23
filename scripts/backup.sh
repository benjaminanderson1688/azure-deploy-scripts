#!/bin/bash
set -euo pipefail
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="${BACKUP_DIR:-backups}"
mkdir -p "$BACKUP_DIR"

echo "=== azure-deploy-scripts Backup ==="
echo "Timestamp: $TIMESTAMP"

# Create backup archive
tar czf "$BACKUP_DIR/azure-deploy-scripts_$TIMESTAMP.tar.gz" \
  --exclude=".git" \
  --exclude="node_modules" \
  --exclude="target" \
  --exclude="__pycache__" \
  --exclude=".terraform" \
  .

echo "Backup saved: $BACKUP_DIR/azure-deploy-scripts_$TIMESTAMP.tar.gz"
echo "Size: $(du -h "$BACKUP_DIR/azure-deploy-scripts_$TIMESTAMP.tar.gz" | cut -f1)"

# Keep only last 5 backups
ls -t "$BACKUP_DIR"/azure-deploy-scripts_*.tar.gz 2>/dev/null | tail -n +6 | xargs rm -f 2>/dev/null || true
echo "Cleanup done (keeping 5 most recent)"
