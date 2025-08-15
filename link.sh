#!/bin/bash
# TinySetup linker script

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
FILES=(".tmux.conf" ".vimrc")

for file in "${FILES[@]}"; do
    target="$HOME/$file"
    source="$DOTFILES_DIR/$file"

    # Remove existing file or link
    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "Removing existing $target"
        rm -rf "$target"
    fi

    # Create symlink
    echo "Linking $source -> $target"
    ln -s "$source" "$target"
done

echo "✅ All dotfiles linked successfully."
