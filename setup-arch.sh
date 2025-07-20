#!/usr/bin/env bash

printf "\nInstalling neovim proprietary drivers...\n"
sudo pacman -Syu
sudo mhwd -a pci nonfree 0300
printf "done\n"

printf "\nBuildin Neovim from source...\n"
sudo pacman -S base-devel cmake unzip ninja curl
mkdir -p "$HOME/git/neovim"
git clone https://github.com/neovim/neovim "$HOME/git/neovim/neovim"
cd "$HOME/git/neovim/neovim" && git checkout stable && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

printf "\nDone building and installing Neovim from source!\n"
nvim --version
