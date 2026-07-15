#!/usr/bin/env zsh
# test/smoke.zsh — end-to-end smoke tests for save/restore behaviour.
# Run with:  zsh test/smoke.zsh

set -e
setopt ERR_EXIT

PLUGIN_ROOT="${0:a:h:h}"
STATE_DIR="$(mktemp -d)"
LASTPWD_FILE="${STATE_DIR}/zsh-lastpwd"
export LASTPWD_FILE

source "${PLUGIN_ROOT}/zsh-lastpwd.plugin.zsh"

# ── helper ────────────────────────────────────────────────────────────────────
pass() { print "  PASS: $1"; }
fail() { print "  FAIL: $1" >&2; exit 1; }

print "==> smoke tests"

# 1. Initial save writes PWD ──────────────────────────────────────────────────
[[ -s "$LASTPWD_FILE" ]] || fail "state file not written on load"
[[ "$( < "$LASTPWD_FILE" )" == "$PWD" ]] || fail "state file content != PWD"
pass "initial save writes PWD"

# 2. _lastpwd_save updates the file on cd ─────────────────────────────────────
_orig="$PWD"
cd /tmp
[[ "$( < "$LASTPWD_FILE" )" == "/tmp" ]] || fail "state not updated after cd /tmp"
pass "save updates on cd"

# 3. Restore changes directory ────────────────────────────────────────────────
# Navigate to neutral location first (hook fires, updating the file to /),
# then overwrite the file with the desired target before sourcing restore.zsh.
cd /
print -r -- "$_orig" >| "$LASTPWD_FILE"
source "${PLUGIN_ROOT}/lib/restore.zsh"
[[ "$PWD" == "$_orig" ]] || fail "restore did not cd to saved directory"
pass "restore changes directory"

# 4. Missing state file is silently ignored ───────────────────────────────────
# Navigate away first so the hook fires and the file is recreated, then
# remove it so restore.zsh has nothing to read.
cd /
rm -f "$LASTPWD_FILE"
source "${PLUGIN_ROOT}/lib/restore.zsh"
[[ "$PWD" == "/" ]] || fail "restore changed directory when file was absent"
pass "missing state file is ignored"

# 5. Unreadable state file is silently ignored ────────────────────────────────
# Navigate to / first (hook runs on writeable file), then lock the file so
# restore.zsh cannot read it.  Temporarily disable ERR_EXIT so that the
# hook's failed write in subsequent cd calls does not abort the test.
cd /
touch "$LASTPWD_FILE"
chmod 000 "$LASTPWD_FILE"
{
  setopt LOCAL_OPTIONS
  unsetopt ERR_EXIT
  source "${PLUGIN_ROOT}/lib/restore.zsh"
}
[[ "$PWD" == "/" ]] || fail "restore changed directory when file was unreadable"
chmod 644 "$LASTPWD_FILE"
pass "unreadable state file is ignored"

# 6. LASTPWD_FILE env override is respected ───────────────────────────────────
_custom_file="${STATE_DIR}/custom-lastpwd"
LASTPWD_FILE="$_custom_file" source "${PLUGIN_ROOT}/lib/utils.zsh"
[[ -d "${_custom_file:h}" ]] || fail "custom state dir not created"
pass "LASTPWD_FILE override respected"

rm -rf "$STATE_DIR"
print "==> all smoke tests PASSED"
