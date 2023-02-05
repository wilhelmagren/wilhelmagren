#!/bin/bash

# Inspired by pajlada installation script for dotfiles.
# Usage: func path_to_file name_of_file_in_home_to_symlink_to
function create_home_symlink() {
    if [ -z "$1" ]; then
        >&2 echo "create_home_symlink: missing first argument, path to file"
        exit 1
    fi

    THIS_DOTFILE_PATH="$PWD/$1"
    if [ -z "$2" ]; then
        HOME_DOTFILE_PATH="$HOME/$1"
    else
        HOME_DOTFILE_PATH="$HOME/$2"
    fi

    printf "Installing %s into %s" "$1" "$HOME_DOTFILE_PATH"
    
    if [ -L "$HOME_DOTFILE_PATH" ]; then
        echo " skipping, target is already a symlink"
        return
    fi

    if [ -f "$HOME_DOTFILE_PATH" ] && [ ! -L "$HOME_DOTFILE_PATH" ]; then
        printf " You already have a regular file at %s. Do you want to remove it? [Y/n] "
        "$HOME_DOTFILE_PATH"
        read -r response
        if [ "$response" = "y" ] || [ "$response" = "Y" ]; then
            rm "$HOME_DOTFILE_PATH"
        else
            return
        fi
    fi
    
    ln -s "$THIS_DOTFILE_PATH" "$HOME_DOTFILE_PATH" 2>/dev/null
    echo " done!"
}

# Possible devices: desktop, laptop.
DEVICE="${1:-desktop}"

echo "Creating symlinks as device $DEVICE..."

mkdir -p "$HOME/.config"

dotfiles=".bashrc .bash_aliases .tmux.conf .config/nvim .config/alacritty"
for dotfile in $dotfiles; do
    create_home_symlink "$dotfile"
done

PLUG_PATH=${HOME}/.config/nvim/autoload/plug.vim
if [ ! -f "$PLUG_PATH" ]; then
    echo "Installing vim-plug..."
    curl -fLo "$PLUG_PATH" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

