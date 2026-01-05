sudo dnf copr enable atim/starship
sudo dnf install alacritty zoxide zsh zsh-autosuggestions neovim fzf starship python poetry nodejs code bat
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
cp keybindings.json ~/.config/Code/User/keybindings.json
echo "Install 'eza' manually as it is not in the repos"