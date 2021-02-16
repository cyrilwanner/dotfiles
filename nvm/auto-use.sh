#!/bin/zsh

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      if [ $ZSH_LOADED ]; then
        nvm install
      else
        nvm install > /dev/null
      fi
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      if [ $ZSH_LOADED ]; then
        nvm use
      else
        nvm use > /dev/null
      fi
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    if [ $ZSH_LOADED ]; then
      echo "Reverting to nvm default version"
      nvm use default
    else
      nvm use default > /dev/null
    fi
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
