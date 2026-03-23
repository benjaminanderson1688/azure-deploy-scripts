#!/bin/bash
set -euo pipefail
BACKUP="${1:?Usage: $0 <backup_file>}"
[ -f "$BACKUP" ] || { echo "File not found: $BACKUP"; exit 1; }

echo "=== Restoring azure-deploy-scripts from $BACKUP ==="
tar xzf "$BACKUP" -C .
echo "Restore complete"
