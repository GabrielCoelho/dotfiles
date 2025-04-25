# 🚀 Dotfiles - Configuração de Ambiente Personalizado

[![GitHub license](https://img.shields.io/github/license/GabrielCoelho/dotfiles)](https://github.com/GabrielCoelho/dotfiles/blob/main/LICENSE)
[![Fish Shell](https://img.shields.io/badge/Shell-Fish-blue)](https://fishshell.com/)
[![Neovim](https://img.shields.io/badge/Editor-Neovim-green)](https://neovim.io/)
[![i3WM](https://img.shields.io/badge/WM-i3-purple)](https://i3wm.org/)

Este repositório contém meus arquivos de configuração personalizados (dotfiles) para criar um ambiente de desenvolvimento produtivo e harmonioso baseado em Linux.

![Preview do Ambiente](https://via.placeholder.com/800x450.png?text=Preview+do+Ambiente)

## 📋 Conteúdo

- [Visão Geral](#visão-geral)
- [Estrutura do Repositório](#estrutura-do-repositório)
- [Principais Recursos](#principais-recursos)
- [Temas e Estilos](#temas-e-estilos)
- [Instalação](#instalação)
- [Teclas e Atalhos](#teclas-e-atalhos)
- [Aplicativos Personalizados](#aplicativos-personalizados)
- [Contribuição](#contribuição)

## 🌐 Visão Geral

Este conjunto de configurações é projetado para funcionar no EndeavourOS (baseado em Arch Linux), com ênfase em:

- **Produtividade**: Fluxos de trabalho otimizados com atalhos de teclado eficientes
- **Minimalismo**: Interface limpa e funcional com foco no conteúdo
- **Personalização**: Alta adaptabilidade para diferentes casos de uso
- **Teclado-centrismo**: Uso mínimo do mouse com o layout de teclado MotionDvorakBR
- **Terminal-centrismo**: Foco em ferramentas de terminal para maior eficiência

## 📂 Estrutura do Repositório

O repositório está organizado da seguinte forma:

```
.
├── .config/               # Configurações de aplicativos
│   ├── fish/              # Shell Fish
│   ├── i3/                # Gerenciador de janelas i3
│   ├── nvim/              # Editor Neovim
│   ├── wezterm/           # Terminal WezTerm
│   ├── tmux/              # Multiplexador de terminal
│   ├── yazi/              # Gerenciador de arquivos
│   ├── mutt/              # Cliente de email
│   ├── calcurse/          # Calendário/Agenda
│   └── ...                # Outras configurações
├── .local/                # Arquivos locais do usuário
├── .tmux/                 # Plugins e configurações do Tmux
├── .motiondvorakbr/       # Configuração do teclado personalizado
├── INSTALL.md             # Guia de instalação
└── README.md              # Este arquivo
```

## ✨ Principais Recursos

### 🐚 Fish Shell
- Prompt personalizado com Tide
- Aliases úteis para Git, Tmux e outros
- Integração com NVM, SDK e ferramentas de desenvolvimento
- Autocompletamento avançado

### 📝 Neovim
- Sistema completo de plugins gerenciados por Lazy.nvim
- LSP configurado para múltiplas linguagens
- Formatação e lint automáticos
- Temas e cores baseados em Gruvbox
- Debug integrado com DAP
- Gerenciamento de Git com Gitsigns

### 🪟 i3 Window Manager
- Tiling otimizado para múltiplos monitores
- Atalhos intuitivos para navegação
- Configuração personalizada da barra i3blocks
- Integração com Picom para efeitos visuais sutis

### 📊 Tmux
- Multiplexação de terminais eficiente
- Statusbar personalizada com informações úteis
- Atalhos de teclado intuitivos
- Integração com Neovim

### 📅 Ferramentas de Produtividade
- Calcurse para calendário e agendamento
- NeoMutt para gerenciamento de email
- ZK para sistema de notas interligadas (Zettelkasten)
- Yazi para navegação eficiente de arquivos

## 🎨 Temas e Estilos

Este ambiente utiliza um esquema de cores baseado em Gruvbox, proporcionando uma experiência visual coesa entre todos os aplicativos:

- **Cores principais**: Tons terrosos e quentes, com destaque em azul e laranja
- **Fonte**: MonaspiceXe Nerd Font para terminal e editor
- **Estilo da interface**: Minimalista com informações essenciais
- **Transparência**: Suporte a transparência ajustável via Picom

## 📥 Instalação

Para instalar estas configurações, siga o guia detalhado em [INSTALL.md](INSTALL.md).

Resumo rápido:

```bash
# Clone o repositório
git clone https://github.com/GabrielCoelho/dotfiles ~/.dotfiles

# Use stow para criar symlinks
cd ~/.dotfiles
stow .
```

## ⌨️ Teclas e Atalhos

### Neovim

| Atalho         | Ação                           |
|----------------|--------------------------------|
| `,` (Leader)   | Tecla líder                    |
| `,w`           | Salvar arquivo                 |
| `,q`           | Fechar                         |
| `,sm`          | Formatar código                |
| `,ok`          | Buscar arquivos                |
| `,os`          | Buscar texto                   |
| `,aa`          | Adicionar arquivo ao Harpoon   |
| `,ae`          | Exibir menu do Harpoon         |
| `-`            | Abrir navegador de arquivos    |

### i3wm

| Atalho               | Ação                          |
|----------------------|-------------------------------|
| `Mod+Return`         | Abrir terminal                |
| `Mod+d`              | Menu de aplicativos           |
| `Mod+Shift+q`        | Fechar janela                 |
| `Mod+h/j/k/l`        | Navegar entre janelas         |
| `Mod+Shift+e`        | Menu de saída                 |
| `Mod+Shift+n`        | Criar novo workspace vazio    |
| `Print`              | Capturar tela                 |

### Tmux

| Atalho             | Ação                           |
|--------------------|--------------------------------|
| `Ctrl+t`           | Prefixo (substituindo Ctrl+b)  |
| `Prefix+v`         | Split vertical                 |
| `Prefix+h`         | Split horizontal               |
| `Prefix+r`         | Recarregar configuração        |
| `Prefix+I`         | Instalar plugins               |

## 📱 Aplicativos Personalizados

Estes dotfiles incluem configurações para os seguintes aplicativos especializados:

- **WezTerm**: Terminal moderno com suporte a GPU
- **Zen-Browser**: Navegador minimalista
- **Espanso**: Expansor de texto para automação
- **Navi**: Ferramenta de cheatsheet interativa
- **MotionDvorakBR**: Layout de teclado otimizado para programação

## 👥 Contribuição

Sugestões e contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou pull requests para melhorar estas configurações.

---

⚙️ Feito com 💙 por [Gabriel Coelho](https://github.com/GabrielCoelho)
