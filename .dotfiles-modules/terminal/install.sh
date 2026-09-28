# Detect package manager and register base terminal and build dependencies
# Fedora toolchain and CLI utilities
if which dnf &>/dev/null; then
  as_root <<_
    dnf groupinstall -y @development-tools 
    dnf install -y \
      curl \
      wget \
      git \
      ripgrep \
      fzf \
      tree \
      tmux
_
# Debian / Ubuntu / Kali toolchain and CLI utilities
elif which apt-get &>/dev/null; then
  as_root <<_
    apt-get update
    apt-get install -y \
      build-essential \
      curl \
      wget \
      git \
      ripgrep \
      fzf \
      tree \
      tmux
_
fi