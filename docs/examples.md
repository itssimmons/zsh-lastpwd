# Examples

## Basic usage

Once the plugin is loaded, every directory change is remembered automatically.
Start a new terminal session and you land in the directory you were in last.

```
$ cd ~/projects/my-app
$ # open a new terminal…
$ pwd
/home/user/projects/my-app
```

## Using a project-specific state file

Keep separate "last directories" per project by wrapping the plugin load in a
function or by setting `LASTPWD_FILE` conditionally:

```zsh
# .zshrc
if [[ -d ~/work ]]; then
  export LASTPWD_FILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh-lastpwd-work"
fi
zi light itssimmons/zsh-lastpwd
```

## Disable restore on startup, keep save

Load the plugin, then override the restore step by exporting a path to a
non-existent file before sourcing — or simply `unset LASTPWD_FILE` after
loading to stop future saves:

```zsh
zi light itssimmons/zsh-lastpwd
# Don't restore on the *next* new session:
unset LASTPWD_FILE
```

## Per-session opt-out

Add a shell alias to open a new zsh that skips the restore:

```zsh
alias zsh-clean='LASTPWD_FILE=/dev/null zsh'
```
