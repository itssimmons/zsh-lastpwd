# lib/utils.zsh — path resolution and directory bootstrapping

# Default file location follows XDG Base Directory Specification.
# Override by setting LASTPWD_FILE before sourcing the plugin.
: "${LASTPWD_FILE:=${XDG_STATE_HOME:-$HOME/.local/state}/zsh-lastpwd}"

# Ensure the parent directory exists.
mkdir -p "${LASTPWD_FILE:h}"
