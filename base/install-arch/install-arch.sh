#!/bin/sh

pacman -S --noconfirm --needed base-devel alacritty zoxide zsh zsh-autosuggestions zsh-syntax-highlighting zsh-completions neovim fzf starship python poetry nodejs ttf-jetbrains-mono-nerd code fd bat eza hyprshot swaync
. ./install-yay.sh
yay -S fzf-tab-git
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
