#!/bin/sh
set -eu

# Node.js and it's package managers
if [ "$(command -v yarn)" ]; then
  yarn cache clean
fi
if [ "$(command -v npm)" ]; then
  npm cache clean --force
fi
if [ "$(command -v pnpm)" ]; then
  pnpm store prune
fi
if [ "$(command -v bun)" ]; then
  /bin/rm -rf "$HOME/.bun/install/cache"
fi

# Python and it's package managers
if [ "$(command -v python3)" ] && [ "$(command -v pip3)" ]; then
  python3 -m pip cache purge
fi

# Rust
if [ "$(command -v cargo)" ]; then
  /bin/rm -rf "$HOME/.cargo/registry"
fi

# Golang
if [ "$(command -v go)" ]; then
  /bin/rm -rf "$(go env GOCACHE)"
  go clean -modcache
fi

# Ruby and Ruby GEM package manager
if [ "$(command -v gem)" ]; then
  /bin/rm -rf "$HOME/.gem/cache"

  find ~/.gem -iname 'cache' | xargs -L1 /bin/rm -rf
fi
if [ "$(command -v ruby)" ]; then
  /bin/rm -rf "$HOME/.bundle/cache"
fi

# Docker
if [ "$(command -v docker)" ]; then
  docker system prune --volumes --force
fi

# Homebrew
if [ "$(command -v brew)" ]; then
  brew cleanup -s --prune=all
fi

# Linux APT
if [ "$(command -v apt)" ]; then
  sudo apt clean --yes
  sudo apt autoclean --yes
  sudo apt-get autoremove --yes
fi
