# Guia de Instalação do Ambiente

> Este guia documenta o processo de instalação e configuração do meu ambiente de desenvolvimento personalizado no EndeavourOS.

## Sumário

- [Preparação Inicial](#preparação-inicial)
- [Aplicações Essenciais](#aplicações-essenciais)
  - [Neovim](#neovim)
  - [Fish Shell](#fish-shell)
  - [Zen-Browser](#zen-browser)
  - [Teclado MotionDvorakBR](#configuração-de-teclado-motiondvorakbr)
  - [Yazi (Gerenciador de Arquivos)](#yazi-rs)
  - [NeoMutt (Cliente de Email)](#neomutt)
  - [WezTerm (Terminal)](#wezterm)
  - [Tmux (Gerenciador de Sessões)](#tmux)
  - [Git (Controle de Versão)](#configurações-git)
  - [Zk (Gerenciador de Notas)](#zk)
  - [Calcurse (Calendário/Agenda)](#calcurse)
- [Ferramentas de Desenvolvimento](#development-tools)
  - [Java](#java)
  - [Node.js](#node)
  - [Rust](#rust)
- [Organização de Diretórios](#diretórios)
- [Aplicativos Adicionais](#outros-aplicativos)
- [Implementação das Configurações](#adicionando-o-repositório-dotfiles)

## Preparação Inicial

### Atualização do Sistema

```bash
sudo pacman -Syu
```

### Instalação do Stow e Outras Dependências Básicas

```bash
yay -S stow picom
```

### Clonagem e Configuração dos Dotfiles

```bash
# Na pasta home "~/"
git clone https://github.com/GabrielCoelho/dotfiles .dotfiles
rm -rf ~/.config/i3/ ~/.config/rofi/ ~/.config/user-dirs.*
cd .dotfiles
stow .
```

## Aplicações Essenciais

### Neovim

```bash
yay -S neovim

# Dependências
yay -S xclip xsel python-pynvim python
```

### Fish Shell

```bash
yay -S fish
rm ~/.dotfiles/.config/fish/*/nvm*
fisher install jorgebucaran/nvm.fish
yay -S brightnessctl gammastep
```

### Zen-Browser

```bash
yay -S zen-browser-bin
fish -c "set -U BROWSER /bin/zen-browser"
```

### Configuração de Teclado MotionDvorakBR

```bash
# Na home ~/ digite os seguintes comandos:
sudo cp .motiondvorakbr/motiondvorak /usr/share/X11/xkb/symbols/motiondvorak
# digite a senha
setxkbmap motiondvorak
```

### Yazi-rs

```bash
yay -S yazi
```

### NeoMutt

```bash
yay -S neomutt mutt-wizard isync lynx urlview xdg-open-server

# Configuração da conta de email
mw -l # Se houver uma conta e, ao tentar entrar dar erro, executar os comandos abaixo
mw -d # delete a conta
gpg --full-generate-key # seguir o passo a passo
pass init $EMAIL # onde $EMAIL é o email da sua conta.
mw -a $EMAIL # siga o passo a passo para configurar a conta.
# Talvez seja necessário entrar com neomutt e executar `i1` para entrar na pasta.
```

### WezTerm

```bash
yay -S wezterm
yay -S zoxide # para melhorar a navegação entre diretórios
yay -S eza # para substituir o comando ls com mais recursos

# Configurar o tema do Fish com Tide
fish -c "tide configure"
```

### Tmux

```bash
sudo pacman -S tmux

# Gerenciador de plugins para Tmux
rm -rf ~/.tmux/plugins/tpm ~/.tmux/plugins/tmux-powerline
git clone https://github.com/tmux-plugins/tpm ~/.dotfiles/.tmux/plugins/tpm/

# Iniciar tmux e instalar plugins
# Pressione <prefix>r para recarregar configurações
# Pressione <prefix>I para instalar plugins
```

### Configurações Git

```bash
git config --global user.name "Gabriel Coelho Soares"
git config --global user.email gbcoe@outlook.com.br
git config --global core.editor nvim

# Gerar e configurar chave SSH
ssh-keygen -t ed25519 -C "gbcoe@outlook.com.br"
cat ~/.ssh/id_ed25519.pub # copiar o conteúdo e adicionar no Github
```

### Zk

```bash
# Instalar o zk (gerenciador de notas)
yay -S zk

# O plugin nvim-zk já está configurado nos dotfiles
# Para inicializar um novo diretório de notas:
zk init ~/caminho/para/suas/notas

# Configuração básica do zk (opcional)
zk config --dir ~/caminho/para/suas/notas
```

### Calcurse

```bash
# Instalar o calendário/agenda Calcurse
yay -S calcurse

# Iniciar e configurar
calcurse

# Os arquivos de configuração já estão nos dotfiles
# Para importar calendários externos:
calcurse-import
```

## Development Tools

### Java

```bash
# Instalar SDKMAN para gerenciar versões do Java
curl -s "https://get.sdkman.io" | bash

# Em um novo terminal
sdk install java 21.0.6-amzn # Amazon Corretto versão 21
sdk install maven # Instalar Maven
```

### Node

```bash
# Instalar NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

# Instalar Node.js LTS
nvm install lts
nvm use lts

# Pacotes globais úteis
npm install -g live-server
```

### Rust

```bash
# Instalar Rustup e configurar Rust
yay -S rustup
rustup install stable
rustup default stable
fisher install usami-k/fish-rustup
```

## Diretórios

```bash
# Criar estrutura de diretórios PARA pessoal
mkdir -p ~/1.\ Projects/ ~/0.\ Inbox/ ~/2.\ Areas/ ~/3.\ Resources/ ~/4.\ Archives/

# Mover diretórios padrão para Resources
mv -t ~/3.\ Resources/ ~/Documentos/ ~/Downloads/ ~/Modelos/ ~/Vídeos/ ~/Imagens/ ~/Músicas/ ~/Público/ ~/Área\ de\ trabalho/

# Clonar repositórios importantes
cd ~/0.\ Inbox/
git clone git@github.com:GabrielCoelho/full-sb.git mybrain
git clone git@github.com:GabrielCoelho/GabrielCoelho.github.io.git public_notes
git clone git@github.com:GabrielCoelho/GabrielCoelho.git

# Para sincronização com OneDrive (opcional)
yay -S onedriver # para conectar com a nuvem (salvar em áreas)
```

## Outros Aplicativos

```bash
# Aplicativos adicionais úteis
yay -S morgen-bin # Calendário
yay -S mgba-qt # Emulador
yay -S espanso-x11 # Expansor de texto
yay -S obsidian # Notas

# Configurar espanso
cd ~/.dotfiles/
cd .config/espanso/match
ls
# Se já houver arquivos, basta atualizar:
git fetch && git pull # ou gfp
# Se não houver, adicionar submódulo:
git submodule add https://github.com/GabrielCoelho/espanso-matches.git .config/espanso/match
```

## Adicionando o Repositório Dotfiles

Se você ainda não limpou as pastas de configuração, aqui estão os comandos para preparar seu sistema:

```bash
# Neovim
sudo rm -rf ~/.config/nvim/

# Fish
sudo rm -rf ~/.config/fish/

# i3wm
sudo rm -rf ~/.config/i3/
sudo rm -rf ~/.config/i3status/

# WezTerm
rm ~/.wezterm.lua

# Clonar e aplicar dotfiles
cd ~ && git clone https://github.com/GabrielCoelho/dotfiles .dotfiles
cd ~/.dotfiles/ && stow .
```

## Configuração Final do Tmux-Powerline

Para configurar corretamente o tema do Tmux-Powerline:

```bash
# Iniciar uma sessão tmux
tmux

# Instalar plugins 
# Pressione <prefix>+I para instalar todos os plugins

# Para aplicar o tema Gruvbox ao tmux-powerline
sudo cp ~/.dotfiles/.config/tmux-powerline/themes/gruvbox.sh ~/.tmux/plugins/tmux-powerline/themes/default.sh

# Resetar o tmux com o prefixo + r
```

Após seguir todos estes passos, você terá um ambiente de desenvolvimento completamente configurado com todas as ferramentas necessárias.
