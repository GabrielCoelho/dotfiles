#!/bin/bash

# Diretório de destino
DIR="$HOME/3. Resources/Imagens/screenshots"
mkdir -p "$DIR"

# Nome do arquivo com timestamp
FILENAME="$DIR/$(date +%Y-%m-%d_%H-%M-%S)-screenshot.png"

# Tipo de screenshot
case "$1" in
    full)
        # Captura tela inteira
        scrot "$FILENAME"
        xclip -selection clipboard -t image/png < "$FILENAME"
        notify-send "Screenshot" "Screenshot of all screens saved to ~/3. Resources/Imagens/screenshots/$FILENAME.png"
        ;;
    area)
        # Captura área selecionada (scrot usa -s para select)
        scrot -s "$FILENAME"
        xclip -selection clipboard -t image/png < "$FILENAME"
        notify-send "Screenshot" "Screenshot of selected area saved to ~/3. Resources/Imagens/screenshots/$FILENAME.png"
        ;;
    window)
        # Captura janela ativa (scrot usa -u para focused window)
        scrot -u "$FILENAME"
        xclip -selection clipboard -t image/png < "$FILENAME"
        notify-send "Screenshot" "Screenshot of current window saved to ~/3. Resources/Imagens/screenshots/$FILENAME.png"
        ;;
    delay)
        # Captura com delay de 3 segundos
        scrot -d 3 "$FILENAME"
        xclip -selection clipboard -t image/png < "$FILENAME"
        notify-send "Screenshot" "Delayed screenshot saved to ~/3. Resources/Imagens/screenshots/$FILENAME.png"
        ;;
esac
