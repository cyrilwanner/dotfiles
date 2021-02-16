#!/bin/bash

set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

bash "$DIR/zsh/install.sh"
bash "$DIR/vscode/install.sh"
