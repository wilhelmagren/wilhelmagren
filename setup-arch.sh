#!/usr/bin/env bash

 printf "\nInstalling neovim proprietary drivers...\n"
 sudo pacman -Syu
 sudo mhwd -a pci nonfree 0300
 printf "done\n"

 printf "\nBuilding and installing Neovim from source...\n"
 sudo pacman -S base-devel cmake unzip ninja curl
 mkdir -p "$HOME/git/neovim"
 git clone https://github.com/neovim/neovim "$HOME/git/neovim/neovim"
 cd "$HOME/git/neovim/neovim" && git checkout stable && make CMAKE_BUILD_TYPE=RelWithDebInfo
 sudo make install

 printf "\nDone building and installing Neovim from source!\n"
 nvim --version

 printf "\nInstalling rust...\n"
 curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
 printf "\Done installing rust\n"

printf "\nBuilding and installing alacritty from source...\n"
sudo pacman -S cmake freetype2 fontconfig pkg-config make libxcb libxkbcommon python
mkdir -p "$HOME/git/alacritty"
git clone https://github.com/alacritty/alacritty.git "$HOME/git/alacritty/alacritty"
cd "$HOME/git/alacritty/alacritty"
git checkout v0.15.1
cargo build --release
infocmp alacritty
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
printf "\nDone building and installing Alacritty from source!\n"
