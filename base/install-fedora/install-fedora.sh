#!/bin/sh

dnf -y copr enable atim/starship
dnf -y copr enable dturner/eza
dnf -y install alacritty zoxide zsh zsh-autosuggestions zsh-syntax-highlighting zsh-completions neovim fzf starship python poetry nodejs code bat eza
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim