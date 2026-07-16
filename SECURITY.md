# Security Policy

## Supported Versions

Security fixes are applied to the latest tagged release and the current default
branch.

## Reporting a Vulnerability

If you believe you have found a security issue, please do not open a public
issue. Instead, report it privately to the repository maintainers through the
GitHub security advisory flow.

When reporting, include:

- a clear description of the issue
- steps to reproduce
- the affected Zsh version and operating system
- any relevant configuration, especially `LASTPWD_FILE` and `XDG_STATE_HOME`

## Scope

`zsh-lastpwd` is a small shell plugin with no external dependencies. Security
reports should focus on shell execution, path handling, file permissions, and
state-file handling.
