#!/bin/bash

# only continue if oh-my-zsh is already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    exit 0
fi

# install theme
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# install plugins
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# link configs
ln -sf "$HOME/.dotfiles/zsh/.zshrc" "$HOME/.zshrc"

# copy default .zshrc.local if there isn't any
if [ ! -f "$HOME/.zshrc.local" ]; then
    cp "$HOME/.dotfiles/zsh/.zshrc.local" "$HOME/.zshrc.local"
fi
