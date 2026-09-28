#! /bin/bash

if which dnf &>/dev/null; then
  as_root "dnf install -y @development-tools curl wget git vim-enhanced ripgrep fzf tree tmux"
elif which apt-get &>/dev/null; then
  as_root "apt-get update && apt-get install -y build-essential curl wget git vim ripgrep fzf tree tmux"
fi