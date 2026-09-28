#! /bin/bash

export NVM_DIR="$HOME/.nvm"

# Install NVM if not already present
if ! [ -d "$NVM_DIR" ]; then
  echo "  > Installing NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
fi

# Load NVM in the current subshell to provision Node.js
if [ -s "$NVM_DIR/nvm.sh" ]; then
  \. "$NVM_DIR/nvm.sh"

  # Install Node.js LTS if node is missing
  if ! which node &>/dev/null; then
    echo "  > Installing Node.js LTS release..."
    nvm install --lts
    nvm alias default 'lts/*'
  fi
fi