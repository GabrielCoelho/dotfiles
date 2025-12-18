#!/bin/bash

# =============================================================================
# SCRIPT: RClone Auto-Sync Virtus com Shutdown Automático
# AUTOR: Gabriel Coelho Soares
# DESCRIÇÃO: Automatiza sincronização do Google Drive antes de desligar o PC
# VERSÃO: 2.0 - Adaptado para estrutura Johnny Decimal
# =============================================================================

# -----------------------------------------------------------------------------
# CONFIGURAÇÕES PRINCIPAIS
# -----------------------------------------------------------------------------

# Caminho base local
BASE_PATH="$HOME/Virtus"

# Pastas para sincronizar
PASTAS_SYNC=(
  ".obsidian"
  "00-09 System_Meta"
  "10-19 Personal/11 Myself"
  "10-19 Personal/15 Finance"
  "20-29 Knowledge"
  "30-39 Work/31 Career"
  "30-39 Work/32 Job Applications"
  "30-39 Work/35 Maestro Sistemas"
  "40-49 Software/43 Scripts"
  "80-89 Media/83 Screenshots"
  "80-89 Media/84 Movies/84.01 Screen Recorders"
  "80-89 Media/89 Templates"
)

# Arquivo de log
LOG_FILE="$HOME/.local/share/rclone/virtus-sync.log"

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

# Verificar se a pasta base existe
if [[ ! -d "$BASE_PATH" ]]; then
    enviar_notificacao "critical" "$TIMEOUT_LONGO" "Erro - RClone Sync" \
        "❌ Pasta Virtus não encontrada:\n$BASE_PATH" "dialog-error"

    countdown_desligamento 3 "Pasta Virtus não encontrada"
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
    "🔄 Iniciando sincronização de ${#PASTAS_SYNC[@]} pastas..." "folder-sync"

log_debug "Iniciando sincronização de shutdown - ${#PASTAS_SYNC[@]} pastas"

# -----------------------------------------------------------------------------
# PROCESSO DE SINCRONIZAÇÃO
# -----------------------------------------------------------------------------

TOTAL_PASTAS=${#PASTAS_SYNC[@]}
PASTAS_SUCESSO=0
PASTAS_ERRO=0
PASTAS_CONFLITO=0

for pasta in "${PASTAS_SYNC[@]}"; do
    PASTA_ATUAL=$((PASTAS_SUCESSO + PASTAS_ERRO + PASTAS_CONFLITO + 1))

    enviar_notificacao "low" "$TIMEOUT_RAPIDO" "RClone Sync" \
        "📤 Sincronizando [$PASTA_ATUAL/$TOTAL_PASTAS]: $(basename "$pasta")" "folder-sync"

    log_debug "Sincronizando: $pasta"

    # Executar bisync
    rclone bisync "$BASE_PATH/$pasta" "gdrive:$pasta" \
        --resilient \
        --recover \
        --create-empty-src-dirs \
        --max-lock 5m \
        --verbose \
        >> "$LOG_FILE" 2>&1

    RESULTADO=$?

    if [[ $RESULTADO -eq 0 ]]; then
        PASTAS_SUCESSO=$((PASTAS_SUCESSO + 1))
        log_debug "✅ Sucesso: $pasta"
    elif [[ $RESULTADO -eq 2 ]]; then
        PASTAS_CONFLITO=$((PASTAS_CONFLITO + 1))
        log_debug "⚠️ Conflito: $pasta"
    else
        PASTAS_ERRO=$((PASTAS_ERRO + 1))
        log_debug "❌ Erro: $pasta (código: $RESULTADO)"
    fi
done

# -----------------------------------------------------------------------------
# VERIFICAR RESULTADO E FINALIZAR
# -----------------------------------------------------------------------------

if [[ $PASTAS_ERRO -eq 0 && $PASTAS_CONFLITO -eq 0 ]]; then
    # Tudo sincronizado com sucesso
    enviar_notificacao "normal" "$TIMEOUT_NORMAL" "RClone Sync" \
        "✅ Todas as pastas sincronizadas!\n\n$PASTAS_SUCESSO/$TOTAL_PASTAS completas\nHorário: $(date '+%H:%M:%S')" "emblem-default"

    log_debug "Sincronização completa: $PASTAS_SUCESSO/$TOTAL_PASTAS"
    countdown_desligamento $COUNTDOWN_SEGUNDOS "✅ Sincronização completa!"

elif [[ $PASTAS_CONFLITO -gt 0 ]]; then
    # Conflitos detectados
    enviar_notificacao "critical" "$TIMEOUT_LONGO" "RClone Sync" \
        "⚠️ Conflitos detectados!\n\n✅ Sucesso: $PASTAS_SUCESSO\n⚠️ Conflitos: $PASTAS_CONFLITO\n❌ Erros: $PASTAS_ERRO\n\nResolva manualmente após reiniciar." "dialog-warning"

    log_debug "Conflitos detectados - Sucesso: $PASTAS_SUCESSO, Conflitos: $PASTAS_CONFLITO, Erros: $PASTAS_ERRO"
    countdown_desligamento 7 "⚠️ Conflitos detectados (verifique após reiniciar)"

else
    # Erros na sincronização
    enviar_notificacao "critical" "$TIMEOUT_LONGO" "RClone Sync" \
        "❌ Falhas na sincronização!\n\n✅ Sucesso: $PASTAS_SUCESSO\n❌ Erros: $PASTAS_ERRO\n\nVerifique conexão e log." "dialog-error"

    log_debug "Erros na sincronização - Sucesso: $PASTAS_SUCESSO, Erros: $PASTAS_ERRO"
    countdown_desligamento 7 "❌ Falhas na sincronização"
fi

# -----------------------------------------------------------------------------
# DESLIGAMENTO FINAL
# -----------------------------------------------------------------------------

enviar_notificacao "low" 500 "Sistema" "🔌 Desligando computador..." "system-shutdown"
log_debug "Desligando sistema"
systemctl poweroff
