#!/bin/bash

# Diretório para salvar screenshots
SCREENSHOT_DIR="$HOME/3. Resources/Imagens/screenshots"

# Criar diretório se não existir
mkdir -p "$SCREENSHOT_DIR"

# Nome do arquivo com timestamp
FILENAME="$SCREENSHOT_DIR/$(date +%Y-%m-%d-%T)-screenshot.png"

# Tirar screenshot da área selecionada
scrot -s "$FILENAME"

# Verificar se o arquivo foi criado
if [ -f "$FILENAME" ]; then
    # Copiar para clipboard
    xclip -selection clipboard -t image/png -i "$FILENAME"
    # Mostrar notificação
    notify-send "Screenshot saved and copied to clipboard" "File: $(basename "$FILENAME")"
else
    notify-send "Screenshot failed" "Could not capture screenshot"
fi