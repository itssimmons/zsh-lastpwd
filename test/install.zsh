#!/usr/bin/env zsh
# test/install.zsh — verify that the plugin sources without errors.
# Run with:  zsh test/install.zsh

set -e
setopt ERR_EXIT

PLUGIN_ROOT="${0:a:h:h}"
LASTPWD_FILE="$(mktemp)"
export LASTPWD_FILE

print "==> Sourcing plugin from ${PLUGIN_ROOT}"
source "${PLUGIN_ROOT}/zsh-lastpwd.plugin.zsh"

print "==> Checking that _lastpwd_save is defined"
(( ${+functions[_lastpwd_save]} )) || {
  print "FAIL: _lastpwd_save not defined" >&2
  exit 1
}

print "==> Checking that state file was written"
[[ -s "$LASTPWD_FILE" ]] || {
  print "FAIL: state file is empty or missing" >&2
  exit 1
}

rm -f "$LASTPWD_FILE"
print "==> install test PASSED"
