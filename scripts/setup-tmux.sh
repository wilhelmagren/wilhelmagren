#!/usr/bin/env bash

set -eou pipefail

mkdir -p "$HOME/.tmux/plugins"
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
cp "$PWD/.config/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"

