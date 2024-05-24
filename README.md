# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Como instalar o nvim ?

- AppImage ("universal" Linux package)
  The Releases page provides an AppImage that runs on most Linux systems. No installation is needed, just download nvim.appimage and run it. (It might not work if your Linux distribution is more than 4 years old.)

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
```

If the ./nvim.appimage command fails, try:

```bash
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
```

# Optional: exposing nvim globally.

```bash
mv squashfs-root /
ln -s /squashfs-root/AppRun /usr/bin/nvim
nvim
```
