# Emojifinder #

Fuzzy finder for emojis.

## Installation

Requires **fzf**. Install fzf first before this plugin.

You can install this plugin and its dependency `emojify` easily with
any zsh plugin manager. Example of full configuration needed
to use this plugin:

```
export EMOJIFIND_EMOJIFY_PATH="$HOME/.zgen/mrowa44/emojify-master/emojify"
export EMOJIFIND_HOTKEY="^s"

if ! zgen saved; then
  zgen clone mrowa44/emojify
  zgen load mnowotnik/emojifind
fi
```

You can now search emojies from the comfort of your command line by pressing <Ctrl-S> !
