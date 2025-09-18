#!/usr/bin/env bash
set -euo pipefail
echo "[*] Checking basic dependencies..."
command -v curl >/dev/null || (echo "please install curl"; exit 1)
command -v systemctl >/dev/null || (echo "need systemd-based distro"; exit 1)
echo "[ok] precheck passed"
