# Configuration

All configuration is done through environment variables.  
Set any of the variables **before** the plugin is loaded.

## `LASTPWD_FILE`

| Default | `${XDG_STATE_HOME:-$HOME/.local/state}/zsh-lastpwd` |
| ------- | --------------------------------------------------- |
| Type    | Absolute file path                                  |

The file where the last working directory is stored.  
The parent directory is created automatically if it does not exist.

```zsh
# Use a custom location
export LASTPWD_FILE="$HOME/.zsh-lastpwd-state"
```

> **Tip** — if you share your home directory across machines (e.g. NFS),
> point `LASTPWD_FILE` to a path that is local to each host so sessions
> do not interfere with each other.

## `XDG_STATE_HOME`

When `LASTPWD_FILE` is not set, the plugin respects the
[XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/latest/).  
Set `XDG_STATE_HOME` to relocate **all** XDG-compliant state files at once:

```zsh
export XDG_STATE_HOME="$HOME/.local/state"   # this is the default
```
