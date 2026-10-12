#! /usr/bin/env fish

set -gx HOMEBREW_CASK_OPTS         "--appdir=$HOME/Applications"
set -gx HOMEBREW_BUNDLE_NO_UPGRADE 1
set -gx HOMEBREW_NO_ENV_HINTS      1

if not set -q HOMEBREW_PREFIX
  if test -d ~/.linuxbrew
    eval (~/.linuxbrew/bin/brew shellenv fish | string collect)
  else if test -d /home/linuxbrew/.linuxbrew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv fish | string collect)
  else if test -d /opt/homebrew
    eval (/opt/homebrew/bin/brew shellenv fish | string collect)
  end
end
