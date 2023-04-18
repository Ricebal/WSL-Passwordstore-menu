#!/bin/bash
sleep_seconds=45
pass "$(find $HOME/.password-store/ -type f -iname "*.gpg" | sed "s|$HOME/.password-store/||g" | sed 's/.gpg//g' | fzf)" | head -n1 | clip.exe
nohup bash -c "(
ps x | grep \"sleep $sleep_seconds\" | sort -k5 | grep -v grep | awk '{print \$1}' | xargs -I %s -- kill %s;
tmux -c \"sleep $sleep_seconds;  echo \"\" | clip.exe\" &
)" 2>/dev/null
