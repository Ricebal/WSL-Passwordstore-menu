#!/bin/sh
passwords_dir="${PASSWORD_STORE_DIR:-$HOME/.password-store}"
sleep_seconds="${PASSWORD_STORE_CLIP_TIME:-45}"
pass "$(find $passwords_dir -type f -iname "*.gpg" | sed "s|$passwords_dir/||g" | sed 's/.gpg//g' | fzf)" | head -n1 | clip.exe
nohup bash -c "(
ps x | grep \"sleep $sleep_seconds\" | sort -k5 | grep -v grep | awk '{print \$1}' | xargs -I %s -- kill %s;
tmux -c \"sleep $sleep_seconds;  echo \"\" | clip.exe\" &
)" 2>/dev/null
