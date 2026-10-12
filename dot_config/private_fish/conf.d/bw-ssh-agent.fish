#! /usr/bin/env fish

set -l bw_socks \
  $HOME/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock \
  $HOME/.bitwarden-ssh-agent.sock \
  $HOME/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock \
  /run/user/(id -u)/bitwarden-ssh-agent.sock \
  /tmp/bitwarden-ssh-agent.sock

for sock in $bw_socks
  if test -S $sock
    set -gx SSH_AUTH_SOCK $sock
    if status is-interactive
      echo "Using Bitwarden SSH agent socket at: $SSH_AUTH_SOCK"
    end
    break
  end
end
