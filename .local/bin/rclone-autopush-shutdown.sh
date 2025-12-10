#!/bin/bash

# =============================================================================
# SCRIPT: RClone Auto-Sync com Shutdown Automático
# AUTOR: Gabriel Coelho Soares
# DESCRIÇÃO: Automatiza sincronização do Google Drive antes de desligar o PC
# =============================================================================

# -----------------------------------------------------------------------------
# CONFIGURAÇÕES PRINCIPAIS
# -----------------------------------------------------------------------------

# Caminho local do vault
LOCAL_PATH="$HOME/0. Inbox/mybrain"

# Caminho remoto no Google Drive
REMOTE_PATH="gdrive:0. Inbox/mybrain"

# Arquivo de log
LOG_FILE="$HOME/.local/share/rclone/obsidian-sync.log"

# Intervalo entre notificações de progresso (em segundos)
INTERVALO_PROGRESSO=8

# Tempo de countdown final antes de desligar (em segundos)
COUNTDOWN_SEGUNDOS=5

# Configurações das notificações
TIMEOUT_RAPIDO=1500      # 1.5 segundos
TIMEOUT_NORMAL=3000      # 3 segundos
TIMEOUT_LONGO=5000       # 5 segundos

# -----------------------------------------------------------------------------
# FUNÇÕES AUXILIARES
# -----------------------------------------------------------------------------

enviar_notificacao() {
    local urgencia="$1"
    local timeout="$2"
    local titulo="$3"
    local mensagem="$4"
    local icone="${5:-folder-sync}"

    notify-send -u "$urgencia" -t "$timeout" -i "$icone" "$titulo" "$mensagem"
}

log_debug() {
    echo "[$(date '+%H:%M:%S')] $1" >> "$LOG_FILE"
}

countdown_desligamento() {
    local segundos=$1
    local mensagem_status="$2"

    for ((i=segundos; i>0; i--)); do
        enviar_notificacao "low" 950 "Desligando em $i segundo(s)" \
            "$mensagem_status\n\nPressione Ctrl+C no terminal para cancelar" "system-shutdown"
        sleep 1
    done
}

# -----------------------------------------------------------------------------
# VERIFICAÇÕES INICIAIS
# -----------------------------------------------------------------------------

# Verificar se a pasta existe
if [[ ! -d "$LOCAL_PATH" ]]; then
    enviar_notificacao "critical" "$TIMEOUT_LONGO" "Erro - RClone Sync" \
        "❌ Pasta não encontrada:\n$LOCAL_PATH" "dialog-error"

    countdown_desligamento 3 "Pasta de anotações não encontrada"
    systemctl poweroff
    exit 1
fi

# Verificar se rclone está instalado
if ! command -v rclone &> /dev/null; then
    enviar_notificacao "critical" "$TIMEOUT_LONGO" "Erro - RClone Sync" \
        "❌ RClone não está instalado no sistema" "dialog-error"

    countdown_desligamento 3 "RClone não encontrado"
    systemctl poweroff
    exit 1
fi

# Criar diretório de log se não existir
mkdir -p "$(dirname "$LOG_FILE")"

# -----------------------------------------------------------------------------
# PROCESSO PRINCIPAL
# -----------------------------------------------------------------------------

enviar_notificacao "low" "$TIMEOUT_RAPIDO" "RClone Sync" \
    "🔄 Iniciando sincronização com Google Drive..." "folder-sync"

log_debug "Iniciando sincronização de shutdown"

# -----------------------------------------------------------------------------
# PROCESSO DE SINCRONIZAÇÃO
# -----------------------------------------------------------------------------

# Função para mostrar progresso durante sync longo
mostrar_progresso() {
    local contador=0
    while kill -0 $1 2>/dev/null; do
        sleep $INTERVALO_PROGRESSO
        contador=$((contador + 1))

        enviar_notificacao "low" "$TIMEOUT_RAPIDO" "RClone Sync" \
            "📤 Sincronizando... (${contador}x${INTERVALO_PROGRESSO}s)" "folder-sync"
    done
}

# Executar bisync em background
rclone bisync "$LOCAL_PATH" "$REMOTE_PATH" \
    --resilient \
    --recover \
    --create-empty-src-dirs \
    --verbose \
    >> "$LOG_FILE" 2>&1 &

PID_SYNC=$!

# Iniciar monitoramento de progresso
mostrar_progresso $PID_SYNC &
PID_PROGRESSO=$!

# Aguardar o sync terminar
wait $PID_SYNC
RESULTADO_SYNC=$?

# Parar o monitoramento de progresso
kill $PID_PROGRESSO 2>/dev/null || true

# -----------------------------------------------------------------------------
# VERIFICAR RESULTADO E FINALIZAR
# -----------------------------------------------------------------------------

if [[ $RESULTADO_SYNC -eq 0 ]]; then
    # Sync bem-sucedido
    enviar_notificacao "normal" "$TIMEOUT_NORMAL" "RClone Sync" \
        "✅ Anotações sincronizadas com Google Drive!\n\nHorário: $(date '+%H:%M:%S')" "emblem-default"

    log_debug "Sincronização concluída com sucesso"
    countdown_desligamento $COUNTDOWN_SEGUNDOS "✅ Sincronização completa!"

elif [[ $RESULTADO_SYNC -eq 2 ]]; then
    # Conflitos detectados
    enviar_notificacao "critical" "$TIMEOUT_LONGO" "RClone Sync" \
        "⚠️ Conflitos detectados!\n\nArquivos .conflict criados.\nResolva manualmente após reiniciar." "dialog-warning"

    log_debug "Conflitos detectados durante sincronização"
    countdown_desligamento 7 "⚠️ Conflitos detectados (verifique após reiniciar)"

else
    # Sync falhou
    enviar_notificacao "critical" "$TIMEOUT_LONGO" "RClone Sync" \
        "❌ Falha na sincronização!\n\nVerifique conexão de internet.\nVerifique o log para detalhes." "dialog-error"

    log_debug "Erro na sincronização (código: $RESULTADO_SYNC)"
    countdown_desligamento 7 "❌ Falha na sincronização"
fi

# -----------------------------------------------------------------------------
# DESLIGAMENTO FINAL
# -----------------------------------------------------------------------------

enviar_notificacao "low" 500 "Sistema" "🔌 Desligando computador..." "system-shutdown"
log_debug "Desligando sistema"
systemctl poweroff
