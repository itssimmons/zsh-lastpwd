# lib/restore.zsh — restore the last working directory on shell startup

if [[ -r "$LASTPWD_FILE" ]]; then
  builtin cd -- "$( < "$LASTPWD_FILE" )" 2>/dev/null
fi
