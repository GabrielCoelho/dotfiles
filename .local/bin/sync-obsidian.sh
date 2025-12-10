#!/bin/bash

LOCAL_PATH="$HOME/0. Inbox/mybrain"
REMOTE_PATH="gdrive:0. Inbox/mybrain"
LOG_FILE="$HOME/.local/share/rclone/obsidian-sync.log"

# Cria diretório de log se não existir
mkdir -p "$(dirname "$LOG_FILE")"

echo "[$(date)] Iniciando sincronização..." >> "$LOG_FILE"

# Sincronização bidirecional
rclone bisync "$LOCAL_PATH" "$REMOTE_PATH" \
    --resilient \
    --recover \
    --create-empty-src-dirs \
    --verbose \
    >> "$LOG_FILE" 2>&1

echo "[$(date)] Sincronização concluída" >> "$LOG_FILE"
