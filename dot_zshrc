#! /usr/bin/env zsh

if [[ $- == *i* ]] && [[ -z "$FISH_LAUNCHED" ]]; then
  export FISH_LAUNCHED=1
  exec fish
fi

if [[ -z "$HOMEBREW_PREFIX" ]]; then
  if [[ -d ~/.linuxbrew ]]; then
    eval "$(~/.linuxbrew/bin/brew shellenv)"
  elif [[ -d /home/linuxbrew/.linuxbrew ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  elif [[ -d /opt/homebrew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

eval "$(mise activate zsh)"
