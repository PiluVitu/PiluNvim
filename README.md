# 🤠 PiluVim

O template de start do meu nvim, baseado no [LazyVim](https://github.com/LazyVim/LazyVim).

## Dependências

- Golang
- C Compiler `sudo apt install build-essential`
- Ripgrep `sudo apt install ripgrep`
- fd find `sudo apt install fd-find`
- [lazygit](https://github.com/PiluVitu/wsl-setup-guide?tab=readme-ov-file#lazygit)
- unzip `sudo apt install unzip`
- Latex `sudo apt install texlive-full`
- fzf `sudo apt install fzf`

## Como instalar o template no

### Linux / MacOS

- Faça uma backup da sua configuração atual:

```bash
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

- Clone o template:

```bash
git clone https://github.com/PiluVitu/PiluNvim.git ~/.config/nvim
```

- Remova a .git para conseguir fazer suas modificações.

```bash
rm -rf ~/.config/nvim/.git
```

- Inicie o Neovim

```bash
nvim
```

### Windows

- Faça uma backup da sua configuração atual:

```bash
# required
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# optional but recommended
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

- Clone o template:

```bash
git clone https://github.com/PiluVitu/PiluNvim.git ~/.config/nvim
```

- Remova a .git para conseguir fazer suas modificações.

```bash
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force
```

- Inicie o Neovim

```bash
nvim
```

### Teste com Docker

```bash
docker run -w /root -it --rm alpine:edge sh -uelic '
  apk add git lazygit neovim ripgrep alpine-sdk --update
  git clone https://github.com/PiluVitu/PiluNvim.git ~/.config/nvim
  cd ~/.config/nvim
  nvim
'
```

## Debugs

- Local direcionado a aglutinar resolução de bugs que tive com o nvim e seus plugins

### Copilot chat

[Erro 23 na response](https://github.com/CopilotC-Nvim/CopilotChat.nvim/discussions/382#discussioncomment-10196187)
