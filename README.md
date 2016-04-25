# fish-asdf

[asdf](https://github.com/asdf-vm/asdf) plugin for fish.

This will ensure that `asdf` is installed under `~/.asdf` and load it on shell startup.

It also setups completions.

If you want to install asdf somewhere else, set `ASDF_DIR` before loading
the plugin (before `fundle init` if using fundle).

## Installation with [fundle](https://github.com/tuvistavie/fundle)

Add

```
fundle plugin 'tuvistavie/fish-asdf'
```

to your `config.fish` and that's it.
