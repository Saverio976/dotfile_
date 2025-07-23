#!/bin/bash

SRC="$1"
USER_GROUP="$2"

mkdir -p "$HOME/dotfiles"

if [[ -d "$SRC" ]]; then
    echo "Allready there!"
else
    SRC="$HOME/dotfiles/dotfiles"
    git clone git@github.com:Saverio976/dotfile_.git "$SRC" \
        || git clone https://github.com/Saverio976/dotfile_.git "$SRC"
fi

set -x

SRC_zsh="$(dirname $SRC)/zsh"
git clone git@github.com:Saverio976/dotfile_zsh.git "$SRC_zsh" \
    || git clone https://github.com/Saverio976/dotfile_zsh.git "$SRC_zsh"
zsh "$SRC_zsh/install.sh" "$SRC_zsh" "$USER_GROUP"
source "$SRC_zsh/.config/zsh/.zshenv"

SRC_nvim="$XDG_CONFIG_HOME/nvim"
git clone git@github.com:Saverio976/dotfile_zsh.git "$SRC_nvim" \
    || git clone https://github.com/Saverio976/dotfile_zsh.git "$SRC_nvim"
