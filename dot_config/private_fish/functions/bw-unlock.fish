#! /usr/bin/env fish

function bw-unlock
  set -gx BW_SESSION (bw unlock --raw)
end
