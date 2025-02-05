# Configurando minhas configurações

## GNU Stow

A primeira coisa é certificar que o Stow está instalado. Para isso iremos rodar um simples comando:

```bash
stow --version
```

> stow (GNU Stow) version 2.3.1

Se o output for diferente do descrito acima, exceto versões diferentes, você precisará instalar o Stow na sua máquina.

Em máquinas Ubuntu/Debian based (que são as que uso normalmente), basta executar no teriminal `sudo apt install stow`.

## Git

Em seguida, instale o git caso não esteja instalado.

```bash
git --version
```

> git version 2.39.2

Mesmo esquema, se não estiver, basta instalar via teriminal `sudo apt install git`

## TMUX

Instale o tmux

```bash
sudo apt install tmux
```

## Neovim

Para instalar o Neovim, muitas vezes o pacote disponível via instalação CLI não funcionará com os plugins que eu utilizo. Por isso, minha sugestão é baixar o **AppImage** disponibilizado no [Github do projeto](https://github.com/neovim/neovim/releases) e baixar a última versão.

Em seguida, altere as permissões do arquivo baixado e mova-o para a pasta de arquivos binários:

```bash
sudo chmod u+x nvim.appimage && sudo mv nvim.appimage /bin/nvim.appimage
```

Por enquanto é isso.

### NvChad

Agora instalaremos a distribuição do neovim que utilizo, com o seguinte comando:

```bash
git clone https://github.com/NvChad/starter ~/.config/nvim && /bin/nvim.appimage
```

Com o Neovim aberto, o Lazy.nvim irá instalar todos os pacotes que o NvChad considera importantes e, terminada esta configuração automática, podemos sair do neovim. (Basta digitar `:q!` durante o modo **normal**).

Agora, iremos remover as configurações com o comando:

```bash
rm -rf ~/.config/nvim
```

> Tome cuidado e copie corretamente o caminho, para evitar perder todos os arquivos.
> **Isso é necessário para evitar erros com o Stow no momento oportuno**

## Fish

Para instalar o Fish shell, recomendo adicionar à lista de repositórios conforme a distribuição que estiver utilizando: [Acesse o guia clicando aqui](https://fishshell.com/).

- **Observação**

> É possível que se faça necessária a limpeza da pasta `~/.config/fish/` para evitar erros com o Stow

## i3

Supondo que ainda não esteja no i3wm, você precisará instalá-lo. Siga os passos no site oficial [clicando aqui](https://i3wm.org/).

- **Observação**

> É possível que se faça necessária a limpeza da pasta `~/.config/fish/` para evitar erros com o Stow

## WezTerm

Faça a instalação a partir do site com o que mais lhe agradar, basta [clicar aqui](https://wezfurlong.org/wezterm/install/linux.html).

- **Observação**

> É possível que se faça necessária a limpeza da pasta `~/.config/fish/` para evitar erros com o Stow

---

## Adicionando o Repositório "Dotfiles"

Agora as configurações virão a partir do repositório no github. Caso você não tenha limpado nenhuma pasta, aqui vai uma pequena sequência de comandos para cada programa:

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
```

Faça o download do repositório em sua pasta home com o seguinte comando:

```bash
cd ~ && git clone https://github.com/GabrielCoelho/dotfiles .dotfiles
```

E é só iniciar o stow na pasta baixada:

```bash
cd ~/.dotfiles/ && stow .
```

Pronto, qualquer um dos programas que você for utilizar já estará configurado com minhas configurações pessoais

### Um último adendo

No caso do `tmux-powerline` você terá que entrar numa sessão do TMUX, entrar com o prefixo e depois `<Shift+i>` para instalar todos os pacotes. Basta resetar o tmux (`<prefix+r>`) que o tmux-powerline irá funcionar. Se não estiver com o padrão "gruvbox" de cor, você precisará realizar o seguinte comando:

```bash
sudo cp ~/.dotfiles/.config/tmux-powerline/themes/gruvbox.sh ~/.tmux/plugins/tmux-powerline/themes/default.sh
```

Assim, ao resetar o TMUX com o prefixo + r, você terá todas as configurações utilizadas no presente momento: 2024-07-17
