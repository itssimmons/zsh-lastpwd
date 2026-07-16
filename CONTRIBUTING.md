# Contributing to zsh-lastpwd

Thanks for taking the time to help improve `zsh-lastpwd`.

## Before you start

Please read the main documentation first:

- [README.md](README.md)
- [docs/configuration.md](docs/configuration.md)
- [docs/migration.md](docs/migration.md)
- [docs/examples.md](docs/examples.md)

This project is intentionally small: a Zsh plugin split across a few source
files with no external dependencies.

## Reporting issues

Use GitHub Issues for bug reports and feature requests.

- Bug reports: include the Zsh version, `OSTYPE`, steps to reproduce, and what
  you expected to happen.
- Feature requests: explain the problem you are trying to solve and the
  behaviour you would like to see.

The issue templates in `.github/ISSUE_TEMPLATE/` already ask for the most
useful details.

## Making changes

Keep changes focused and consistent with the existing style:

- Prefer small, direct shell functions.
- Avoid adding dependencies unless absolutely necessary.
- Follow the current quoting and `setopt` usage already present in the plugin.

The main entry points are:

- `zsh-lastpwd.plugin.zsh`
- `lastpwd.plugin.zsh`
- `lib/hooks.zsh`
- `lib/restore.zsh`
- `lib/save.zsh`
- `lib/utils.zsh`

## Testing

Run the same checks used by CI before opening a pull request:

```zsh
zsh test/install.zsh
zsh test/smoke.zsh
```

If you change documentation only, these tests are usually not necessary.

## Pull requests

Pull requests are welcome. Please:

1. Describe the change clearly.
2. Link any related issue.
3. Include the test results if you changed plugin behaviour.

## Release checks

Releases are tagged with `v*` and the release workflow runs the smoke tests
before publishing a GitHub Release.