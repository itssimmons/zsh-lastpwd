# zsh-lastpwd

A tiny Zsh plugin that remembers the last directory you were in and restores
it the next time you open a terminal.

```
$ cd ~/projects/my-app
$ # open a new terminal…
$ pwd
/home/user/projects/my-app   ✓
```

The state file follows the
[XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/latest/)
(`$XDG_STATE_HOME`, defaulting to `~/.local/state/zsh-lastpwd`).

## Installation

### Zinit

```zsh
zinit light itssimmons/zsh-lastpwd
```

### Oh My Zsh

```zsh
# Clone into your custom plugins directory
git clone https://github.com/itssimmons/zsh-lastpwd \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-lastpwd"

# Then add to your .zshrc
plugins=(... zsh-lastpwd)
```

### Antigen

```zsh
antigen bundle itssimmons/zsh-lastpwd
```

### Manual

```zsh
source /path/to/zsh-lastpwd/zsh-lastpwd.plugin.zsh
```

## Configuration

| Variable       | Default                                             | Description            |
| -------------- | --------------------------------------------------- | ---------------------- |
| `LASTPWD_FILE` | `${XDG_STATE_HOME:-$HOME/.local/state}/zsh-lastpwd` | Path to the state file |

Set the variable **before** loading the plugin to customise the location:

```zsh
export LASTPWD_FILE="$HOME/.zsh-lastpwd-state"
zinit light itssimmons/zsh-lastpwd
```

See [docs/configuration.md](docs/configuration.md) for full details.

## How it works

1. **Restore** — on shell startup, if the state file is readable, the plugin
   runs `cd` to the saved directory (errors are silently discarded).
2. **Save** — a `chpwd` hook writes `$PWD` to the state file every time the
   directory changes, plus once at startup.

The plugin is intentionally minimal: four small source files in `lib/`
with no external dependencies.

## Documentation

- [Configuration](docs/configuration.md)
- [Migration from a snippet](docs/migration.md)
- [Examples](docs/examples.md)

## Contributing

Bug reports and feature requests are welcome via
[GitHub Issues](https://github.com/itssimmons/zsh-lastpwd/issues).

Pull requests are also welcome. Please run the test suite before submitting:

```zsh
zsh test/install.zsh
zsh test/smoke.zsh
```

## License

[MIT](LICENSE)
