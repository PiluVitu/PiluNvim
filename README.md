# ?? PiluVim

O template de start do meu nvim, baseado no [LazyVim](https://github.com/LazyVim/LazyVim).

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
