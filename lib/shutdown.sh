#!/bin/bash
CLEANUP_FNS=()
trap_shutdown() {
  trap 'echo "Shutting down..."; for fn in "${CLEANUP_FNS[@]}"; do $fn; done; exit 0' SIGINT SIGTERM
}
register_cleanup() { CLEANUP_FNS+=("$1"); }
