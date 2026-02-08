sudo pacman -S --needed base-devel alacritty zoxide zsh zsh-autosuggestions zsh-syntax-highlighting zsh-completions neovim fzf starship python poetry nodejs ttf-jetbrains-mono-nerd code fd bat eza 
cp keybindings.json ~/.config/Code/User/keybindings.json
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -S fzf-tab-git
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
