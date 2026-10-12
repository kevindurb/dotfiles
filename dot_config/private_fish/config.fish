#! /usr/bin/env fish

if status is-interactive

  set -g fish_greeting

  set -g fish_color_command brgreen
  set -g fish_color_keyword brgreen
  set -g fish_color_error red --bold
  set -g fish_color_param cyan

  abbr --add c clear
  abbr --add g git
  abbr --add k kubectl

  command -q eza; and alias ls 'eza'
  command -q eza; and alias ll 'eza -lah --git --group-directories-first'
  command -q eza; and alias tree 'eza --tree'
  command -q bat; and alias cat 'bat'
  command -q duf; and alias df 'duf'
  command -q ncdu; and alias du 'ncdu'
  command -q htop; and alias top 'htop'
  command -q prettyping; and alias ping 'prettyping --nolegend'

  alias mux 'tmuxp load -y'

  starship init fish | source

end
