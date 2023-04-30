#!/bin/sh
PASSWORDS_DIR="${PASSWORD_STORE_DIR:-$HOME/.password-store}"
sleep_seconds=45
pass "$(find $PASSWORDS_DIR -type f -iname "*.gpg" | sed "s|$PASSWORDS_DIR/||g" | sed 's/.gpg//g' | fzf)" | head -n1 | clip.exe
nohup bash -c "(
ps x | grep \"sleep $sleep_seconds\" | sort -k5 | grep -v grep | awk '{print \$1}' | xargs -I %s -- kill %s;
tmux -c \"sleep $sleep_seconds;  echo \"\" | clip.exe\" &
)" 2>/dev/null
