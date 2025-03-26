# Instruções de Instalação

> Tive de reinstalar meu linux e aqui está um passo a passo criado conforme eu tive a necessidade de reinstalar tudo.

- OS: EndeavourOs

----------

## Primeiro Boot

1. Atualizar

```bash
sudo pacman -Syu
```

2. .dotfiles

```bash
yay stow
yay picom
# na pasta home "~/"
git clone https://github.com/GabrielCoelho/dotfiles .dotfiles
rm ~/.config/i3/ ~/.config/rofi/ ~/.config/user-dirs.*
cd .dotfiles
stow .
```

Os comandos acima clonam o meu repositório de dotfiles, apagam as configurações atuais do EndeavourOs e aplicam as minhas junto do `stow`.

## Instalação de aplicações principais

1. Neovim

`yay neovim`

Ao iniciar ele ainda precisará instalar todas as outras configurações para funcionar perfeitamente, mas já estará com os meus mappings e completions necessários.

`yay xclip`
`yay xsel`
`yay python-pynvim`
`yay python`

2. Fish

`yay fish`
`rm ~/.dotfiles/.config/fish/*/nvm*`
`fisher install jorgebucaran/nvm.fish`
`yay brightnessctl`
`yay gammastep`

3. Zen-Browser

`yay zen-browser`
`set -g BROWSER /bin/zen-browser`

> **Importante:** Escolher a opção `zen-browser-bin`


4. Configuração de Teclado `MotionDvorakBR`

```bash
# Na home ~/ digite os seguintes comandos:
sudo cp .motiondvorakbr/motiondvorak /usr/share/X11/xkb/symbols/motiondvorak
# digite a senha
setxkbmap motiondvorak
```

5. Yazi-rs

`yay yazi`

6. neomutt

```bash
yay neomutt
yay mutt-wizard
yay isync
yay lynx
yay urlview
yay xdg-open-server
mw -l # Se houver uma conta e, ao tentar entrar dar erro, executar os comandos abaixo
mw -d # delete a conta
gpg --full-generate-key # seguir o passo a passo
pass init $EMAIL # onde $EMAIL é o email da sua conta.
mw -a $EMAIL # siga o passo a passo e a conta deve estar configurada.
# Talvez seja necessário entrar com neomutt e executar `i1` para entrar na pasta.
```


7. Wezterm

`yay wezterm`
`yay zoxide` -> quando iniciamos o Wezterm ele já inicia no Fish. Para evitar mensagens de erros, vamos instalar já.
`yay eza` -> para rodar o *lla* corretamente

Para configurar o fish com o `tide` basta rodar o seguinte: `tide configure`

8. Tmux

`yay tmux`

Para configurar o tmux do jeito que eu gosto, preciso instalar o tmux-pluging-manager
Tive de apagar a pasta ~/.tmux/plugins/tpm e a pasta do ~/.tmux/plugins/tmux-powerline.

Reinstalei o `tpm` via: `git clone https://github.com/tmux-plugings/tpm ~/.dotfiles/.tmux/plugins/tpm/`
Iniciei o tmux e rodei um `<prefix>r` para recarregar as configurações, e depois `<prefix>I` para instalar os plugins.

9. Configurações Git

```bash
git config --global user.name "Gabriel Coelho Soares"
git config --global user.email gbcoe@outlook.com.br
git config --global core.editor nvim
ssh-keygen -t ed25519 -C "gbcoe@outlook.com.br"
cat ~/.ssh/id_ed25519.pub # copiar o conteúdo e adicionar no Github.
```

10. Development tools

**Java**
`curl -s "https://get.sdkman.io" | bash` <- SDKMan!

Abra uma nova `pane` no tmux e digite:

`sdk install java 21.0.6-amzn` <- Corretto versão 21.
`sdk install maven` <- maven

**Node**
`curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash` <- Node Version Manager
`nvm install lts`
`nvm use lts`
`npm install -g live-server`

**Rust**

```bash
yay rustup
rustup install stable
rustup default stable
fisher install usami-k/fish-rustup
```

----------

## Diretórios

```bash
# em ~/
mkdir 1.\ Projects/ 0.\ Inbox/ 2.\ Areas/ 3.\ Resources/ 4.\ Archives/
mv -t ~/3.\ Resources/ ~/Documentos/ ~/Downloads/ ~/Modelos/ ~/Vídeos/ ~/Imagens/ ~/Músicas/ ~/Público/ ~/Área\ de\ trabalho/
cd ~/0.\ Inbox/
git clone git@github.com:GabrielCoelho/full-sb.git mybrain
git clone git@github.com:GabrielCoelho/GabrielCoelho.github.io.git public_notes
git clone git@github.com:GabrielCoelho/GabrielCoelho.git
yay onedriver # para conectar com a nuvem (Salvar em áreas)
```

----------

## Outros Aplicativos

```bash
yay morgen-bin
yay mgba-qt
yay espanso-x11
yay obsidian
z dot # cd ~/.dotfiles/
cd .config/espanso/match
ls
# Se já houver arquivos, basta dar um:
git fetch && git pull # ou gfp
# Se não, precisará clonar/adicionar submodulo

```
