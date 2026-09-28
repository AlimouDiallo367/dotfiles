#! /bin/bash

export NVM_DIR="$HOME/.nvm"

# Load NVM into shell session
if [ -s "$NVM_DIR/nvm.sh" ]; then
  \. "$NVM_DIR/nvm.sh"
fi

# Load bash completion
if [ -s "$NVM_DIR/bash_completion" ]; then
  \. "$NVM_DIR/bash_completion"
fi