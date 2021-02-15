# dotfiles

My personal configs.

## Installation

**Warning**: All current configuration files will get overwritten.

```bash
git clone git@github.com:cyrilwanner/dotfiles.git ~/.dotfiles && bash ~/.dotfiles/install.sh
```

## Manual steps

### ZSH

In order for the zsh theme to work correctly, install the required font manually. See instructions [here](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k).

### iTerm

Go to `Preferences -> General -> Preferences` and check `Load preferences from a custom folder or URL`.

Select `~/.dotfiles/iterm`. If the `.dotfiles` folder is not visible, use `Command+Shift+G` and enter it manually.

Restart iTerm after applying the config.

### VS Code

Install the `Dank Mono` font.
