#!/bin/sh

# Node.js and it's package managers
if [ "$(command -v npm)" ] && [ "$(command -v ncu)" ]; then
  ncu --upgrade --global | grep 'npm -g' | xargs -I '{}' bash -c '{}'
fi
# Bun
if [ "$(command -v bun)" ]; then
  bun update --global
fi

# Python and it's package managers
if [ "$(command -v pipx)" ]; then
  pipx upgrade-all
fi

# Rust
if [ "$(command -v rustup)" ]; then
  rustup update
fi

# Golang
# No way of yet

# Ruby and Ruby GEM package manager
if [ "$(command -v gem)" ]; then
  gem list | cut -d ' ' -f 1 | xargs -L1 gem install
fi

# Docker
if [ "$(command -v docker)" ]; then
  docker images --format '{{lower .Repository}}' | xargs -L1 docker pull
fi

# Homebrew
if [ "$(command -v brew)" ]; then
  brew update --verbose
  brew upgrade --formula --verbose
  brew upgrade --cask --greedy --verbose
fi

# Linux APT
if [ "$(command -v apt)" ]; then
  sudo apt update -y
  sudo apt upgrade -y
fi
