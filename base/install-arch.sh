sudo pacman -S --needed base-devel alacritty zoxide zsh zsh-autosuggestions neovim fzf starship python poetry nodejs ttf-jetbrains-mono-nerd code fd bat eza
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
cp keybindings.json ~/.config/Code/User/keybindings.json