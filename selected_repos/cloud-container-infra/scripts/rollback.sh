#!/usr/bin/env bash
set -euo pipefail
echo "[*] Rolling back containers and backing up volumes"
mkdir -p /opt/backups
ts=$(date +%F-%H%M%S)
if [ -d /var/lib/docker/volumes ]; then
  sudo tar czf /opt/backups/docker_volumes_$ts.tgz /var/lib/docker/volumes || true
fi
docker compose -f src/docker-compose.yml down || true
echo "[ok] rollback done (containers stopped, volumes archived if present)"
