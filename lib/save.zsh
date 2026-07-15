# lib/save.zsh — write the current directory to the state file

_lastpwd_save() {
  print -r -- "$PWD" >| "$LASTPWD_FILE"
}
