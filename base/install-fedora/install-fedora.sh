#!/bin/sh

sudo dnf -y copr enable atim/starship
sudo dnf -y copr enable dturner/eza
sudo dnf -y install eza
sudo dnf -y install \
    alacritty \
    zoxide \
    zsh \
    zsh-autosuggestions \
    zsh-syntax-highlighting \
    zsh-completions \
    neovim \
    fzf \
    starship \
    python \
    poetry \
    nodejs \
    code \
    bat
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim