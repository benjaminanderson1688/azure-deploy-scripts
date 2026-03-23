#!/bin/bash
ensure_dir() { mkdir -p "$1"; }
file_hash() { sha256sum "$1" | cut -d" " -f1; }
safe_write() { local tmp="$1.tmp"; echo "$2" > "$tmp"; mv "$tmp" "$1"; }
dir_size() { du -sh "$1" 2>/dev/null | cut -f1; }
