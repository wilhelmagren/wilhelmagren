#!/usr/bin/env bash

set -eou pipefail

CONFIG_REPO_DIR="$PWD/.config/nvim"
NVIM_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"

NVIM_LUA_DIR="$NVIM_CONFIG_DIR/lua"
NVIM_AFTER_DIR="$NVIM_CONFIG_DIR/after"
NVIM_PLUGINS_DIR="$NVIM_CONFIG_DIR/pack/plugins/start"
NVIM_COLORSCHEMES_DIR="$NVIM_CONFIG_DIR/pack/colorschemes/start"

printf "+------------------------------------------------------------+\n"
printf "|                       NEOVIM SETUP                         |\n"
printf "+------------------------------------------------------------+\n"

printf "mkdir -p '$NVIM_CONFIG_DIR'... "
mkdir -p "$NVIM_CONFIG_DIR"
printf "OK\n"

printf "mkdir -p '$NVIM_LUA_DIR'... "
mkdir -p "$NVIM_LUA_DIR"
printf "OK\n"

printf "mkdir -p '$NVIM_AFTER_DIR'... "
mkdir -p "$NVIM_AFTER_DIR"
printf "OK\n"

printf "mkdir -p '$NVIM_PLUGINS_DIR'... "
mkdir -p "$NVIM_PLUGINS_DIR"
printf "OK\n"

printf "mkdir -p '$NVIM_COLORSCHEMES_DIR'... "
mkdir -p "$NVIM_COLORSCHEMES_DIR"
printf "OK\n"

printf "cp '$CONFIG_REPO_DIR/init.lua' '$NVIM_CONFIG_DIR'... "
cp "$CONFIG_REPO_DIR/init.lua" "$NVIM_CONFIG_DIR"
printf "OK\n"

printf "cp '$CONFIG_REPO_DIR/lua/*' '$NVIM_LUA_DIR'... "
cp -r "$CONFIG_REPO_DIR/lua/"* "$NVIM_LUA_DIR"
printf "OK\n"

printf "cp '$CONFIG_REPO_DIR/after/*' '$NVIM_AFTER_DIR'... "
cp -r "$CONFIG_REPO_DIR/after/"* "$NVIM_AFTER_DIR"
printf "OK\n"

declare -A plugins=(
    ["nvim-treesitter"]="https://github.com/nvim-treesitter/nvim-treesitter.git"
    ["nvim-lspconfig"]="https://github.com/neovim/nvim-lspconfig.git"
    ["nvim-cmp"]="https://github.com/hrsh7th/nvim-cmp.git"
    ["cmp-nvim-lsp"]="https://github.com/hrsh7th/cmp-nvim-lsp.git"
    ["cmp-path"]="https://github.com/hrsh7th/cmp-path.git"
    ["cmp-buffer"]="https://github.com/hrsh7th/cmp-buffer.git"
    ["LuaSnip"]="https://github.com/L3MON4D3/LuaSnip.git"
    ["lualine.nvim"]="https://github.com/nvim-lualine/lualine.nvim.git"
    ["plenary.nvim"]="https://github.com/nvim-lua/plenary.nvim.git"
    ["telescope.nvim"]="https://github.com/nvim-telescope/telescope.nvim.git"
    ["conform.nvim"]="https://github.com/stevearc/conform.nvim.git"
)

declare -A colorschemes=(
    ["onedark.nvim"]="https://github.com/navarasu/onedark.nvim.git"
    ["gruvbox.nvim"]="https://github.com/ellisonleao/gruvbox.nvim.git"
)

printf "\nCLONING PLUGIN REPOSITORIES...\n"
for name in "${!plugins[@]}"; do
    printf "  git clone '$name'\n"
    git clone --depth 1 "${plugins[$name]}" "$NVIM_PLUGINS_DIR/$name"
done

printf "\nCLONING COLORSCHEMES REPOSITORIES...\n"
for name in "${!colorschemes[@]}"; do
    printf "  git clone '$name'\n"
    git clone --depth 1 "${colorschemes[$name]}" "$NVIM_COLORSCHEMES_DIR/$name"
done

printf "\nSETUP COMPLETE.\n"
