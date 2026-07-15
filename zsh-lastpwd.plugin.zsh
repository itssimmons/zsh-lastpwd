# zsh-lastpwd.plugin.zsh
# Zinit / zplug / antigen compatible entry-point.
# Sourced automatically when the plugin is loaded.

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

source "${0:h}/lib/utils.zsh"
source "${0:h}/lib/restore.zsh"
source "${0:h}/lib/save.zsh"
source "${0:h}/lib/hooks.zsh"
