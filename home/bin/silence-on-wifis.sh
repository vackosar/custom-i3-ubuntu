#!/bin/bash

export DISPLAY=:0;
export XDG_RUNTIME_DIR=/run/user/1000;
if iwconfig |grep 'ESSID:"TIL-OFFICE'; then
  echo "turning off speaker volume";
  #pactl -- suspend-sink 1 1;
  pactl -- set-sink-mute 1 1
fi;
