#!/usr/bin/env bash
set -euo pipefail

plugins_dir="$HOME/.config/tmux/plugins"
mkdir -p "$plugins_dir"

for repo in \
  tmux-plugins/tmux-sensible \
  tmux-plugins/tmux-pain-control \
  tmux-plugins/tmux-sessionist \
  joshmedeski/tmux-nerd-font-window-name \
  folke/tokyonight.nvim \
  janoamaral/tokyo-night-tmux; do
  dir="$plugins_dir/$(basename "$repo")"
  if [ -d "$dir" ]; then
    git -C "$dir" pull --ff-only
  else
    git clone "https://github.com/$repo" "$dir"
  fi
done
