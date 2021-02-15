#!/bin/bash

if ! which code &> /dev/null; then
    if [ ! -d "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ]; then
        echo "visual studio code not found, skipping extensions"
        exit 0
    fi

    export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi

CONFIG="$HOME/.config/Code/User/"
if [ "$(uname)" = "Darwin" ]; then
    CONFIG="$HOME/Library/Application Support/Code/User/"
fi

# link settings
ln -sf "$HOME/.dotfiles/vscode/settings.json" "$CONFIG/settings.json"
ln -sf "$HOME/.dotfiles/vscode/keybindings.json" "$CONFIG/keybindings.json"

# install util extensions
code --install-extension davidhouchin.whitespace-plus
code --install-extension eamodio.gitlens
code --install-extension editorconfig.editorconfig
code --install-extension mikestead.dotenv
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension sleistner.vscode-fileutils
code --install-extension wix.vscode-import-cost

# install styling extensions
code --install-extension bierner.markdown-checkbox
code --install-extension bierner.markdown-emoji
code --install-extension bierner.markdown-preview-github-styles
code --install-extension bierner.markdown-yaml-preamble
code --install-extension github.github-vscode-theme
code --install-extension pkief.material-icon-theme

# link plugin configs
for WHITESPACE_PLUGIN in `find $HOME/.vscode/extensions/davidhouchin.whitespace-plus* -type d`
do
    ln -sf "$HOME/.dotfiles/vscode/detect-irregular-whitespaces.json" "$WHITESPACE_PLUGIN/config.json"
done
