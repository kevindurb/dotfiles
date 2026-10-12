#! /usr/bin/env fish

set -q XDG_CONFIG_HOME; or set -gx XDG_CONFIG_HOME $HOME/.config
set -q XDG_DATA_HOME;   or set -gx XDG_DATA_HOME   $HOME/.local/share
set -q XDG_STATE_HOME;  or set -gx XDG_STATE_HOME  $HOME/.local/state
set -q XDG_CACHE_HOME;  or set -gx XDG_CACHE_HOME  $HOME/.cache

set -gx NPM_CONFIG_USERCONFIG  $XDG_CONFIG_HOME/npm/npmrc
set -gx ANSIBLE_HOME           $XDG_DATA_HOME/ansible
set -gx AWS_CONFIG_FILE        $XDG_CONFIG_HOME/aws/config
set -gx DOCKER_CONFIG          $XDG_CONFIG_HOME/docker
set -gx GOPATH                 $XDG_DATA_HOME/go
set -gx DOTNET_CLI_HOME        $XDG_DATA_HOME/dotnet
set -gx MYCLI_HISTFILE         $XDG_DATA_HOME/mycli/history
set -gx LESSHISTFILE           $XDG_STATE_HOME/less/history
set -gx TLDR_CACHE_DIR         $XDG_CACHE_HOME/tldr
set -gx PLATFORMIO_CORE_DIR    $XDG_DATA_HOME/platformio
set -gx NODE_REPL_HISTORY      $XDG_DATA_HOME/node_repl_history
set -gx TLRC_CONFIG            $XDG_CONFIG_HOME/tlrc/config.toml

set -gx SHELL                  (command -v fish)
set -gx CLICOLOR               1
set -gx EDITOR                 nvim
set -gx VISUAL                 nvim
set -gx FZF_DEFAULT_COMMAND    'rg --files'
set -gx LESS                   '-SRXF'
set -gx ASPNETCORE_ENVIRONMENT Development
set -gx FX_THEME               1

fish_add_path --global --append $XDG_DATA_HOME/npm/bin
fish_add_path --global --append $HOME/.local/bin
fish_add_path --global --append $GOPATH/bin
