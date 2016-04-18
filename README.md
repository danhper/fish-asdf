# fish-asdf

[asdf](https://github.com/asdf-vm/asdf) plugin for fish.

This will ensure that `asdf` is installed under `~/.asdf` and load it on shell startup.

It also adds completions and some extra commands.

If you want to install asdf somewhere else, set `ASDF_DIR` before loading
the plugin (before `fundle init` if using fundle).

## Installation with [fundle](https://github.com/tuvistavie/fundle)

Add

```
fundle plugin 'tuvistavie/fish-asdf'
```

to your `config.fish` and that's it.

## Bonus commands

This plugin also adds two bonus commands:

  * `local`: `asdf local elixir 1.2.4` will set `elixir` to version `1.2.4` using `.tool-versions` in the current directory
  * `global`: `asdf global elixir 1.2.4` will set `elixir` to version `1.2.4` using `.tool-versions` in the home directory
