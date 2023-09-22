#!/bin/bash

# Check if script is run as root
if [[ "$(id -u)" -eq 0 ]]; then
    echo "This script must not be run as root"
    exit 1
fi

# Update system using yay 
yay

# Install packages
yay -S bat brave-bin btop calcure\
    catppuccin-gtk-theme-mocha clipman exa fd github-cli\
    go grimshot grub-customizer hyprland hyprpaper kitty\
    lazygit meson ninja python rofi spotify starship zathura\
    zoxide tmux

# Check and set Zsh as the default shell
[[ "$(awk -F: -v user="$USER" '$1 == user {print $NF}' /etc/passwd) " =~ "zsh " ]] || chsh -s $(which zsh)

# Install Oh My Zsh
if [ ! -d ~/.oh-my-zsh/ ]; then
    yay -S zsh
else
    omz update
fi

# Install Zsh plugins
[[ "${plugins[*]} " =~ "zsh-autosuggestions " ]] || git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
[[ "${plugins[*]} " =~ "zsh-syntax-highlighting " ]] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

