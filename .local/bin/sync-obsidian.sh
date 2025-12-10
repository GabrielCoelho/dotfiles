#!/bin/bash

LOCAL_PATH="$HOME/0. Inbox/mybrain"
REMOTE_PATH="gdrive:0. Inbox/mybrain"
LOG_FILE="$HOME/.local/share/rclone/obsidian-sync.log"

# Cria diretório de log se não existir
mkdir -p "$(dirname "$LOG_FILE")"

# Notificação de início
notify-send "Obsidian Sync" "Iniciando sincronização..." -i folder-sync

echo "[$(date)] Iniciando sincronização..." >> "$LOG_FILE"

# Sincronização bidirecional
rclone bisync "$LOCAL_PATH" "$REMOTE_PATH" \
    --resilient \
    --recover \
    --create-empty-src-dirs \
    --verbose \
    >> "$LOG_FILE" 2>&1

SYNC_STATUS=$?

# Notificação de resultado
if [ $SYNC_STATUS -eq 0 ]; then
    notify-send "Obsidian Sync" "Sincronização concluída com sucesso" -i emblem-default
    echo "[$(date)] Sincronização concluída com sucesso" >> "$LOG_FILE"
else
    notify-send "Obsidian Sync" "Erro na sincronização. Verifique o log." -u critical -i dialog-error
    echo "[$(date)] Erro na sincronização (código: $SYNC_STATUS)" >> "$LOG_FILE"
fi
