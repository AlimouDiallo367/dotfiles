# Set default editor prioritizing Neovim over Vim
if which nvim &>/dev/null; then
  export EDITOR="nvim"
elif which vim &>/dev/null; then
  export EDITOR="vim"
fi

# Terminal navigation and output formatting aliases
alias ll="ls -lah"
alias grep="grep --color=auto"

# Quick dotfiles bare repo shortcuts
alias dotfiles-log="git \
  --git-dir=$HOME/.dotfiles \
  --work-tree=$HOME \
  log --oneline --graph"