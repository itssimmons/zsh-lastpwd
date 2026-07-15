# lib/hooks.zsh — register the chpwd hook and perform the initial save

autoload -Uz add-zsh-hook

add-zsh-hook chpwd _lastpwd_save

# Save immediately so the current session directory is persisted
# even when the user never changes directories.
_lastpwd_save
