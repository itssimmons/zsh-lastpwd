# Migration

## From a single-file snippet

If you previously sourced a self-contained snippet directly in your `.zshrc`,
replace it with the plugin:

**Before**

```zsh
# .zshrc
LASTPWD_FILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh-lastpwd"
mkdir -p "${LASTPWD_FILE:h}"
if [[ -r "$LASTPWD_FILE" ]]; then
  builtin cd -- "$( < "$LASTPWD_FILE" )" 2>/dev/null
fi
autoload -Uz add-zsh-hook
_lastpwd_save() { print -r -- "$PWD" >| "$LASTPWD_FILE" }
add-zsh-hook chpwd _lastpwd_save
_lastpwd_save
```

**After — Zinit**

```zsh
zi light itssimmons/zsh-lastpwd
```

**After — Oh My Zsh**

```zsh
plugins=(... zsh-lastpwd)
```

The default state-file location is identical, so no existing data needs to
be moved.

## Changing the state-file location

If you previously used a custom path, export `LASTPWD_FILE` before loading
the plugin:

```zsh
export LASTPWD_FILE="$HOME/.zsh_lastdir"
zi light itssimmons/zsh-lastpwd
```
