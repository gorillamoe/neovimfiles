#!/bin/bash

setup() {
        local repo_url="https://git.superevilmegaco.com/marco/neovimfiles"
        local user=$(whoami)
        local homedir=$(getent passwd "$user" | cut -d: -f6)
        local dir="$homedir/code/$user/neovimfiles"
        local timestamp=$(date +%s)
        if [[ -d "$dir" ]] || [[ -L "$dir" ]]; then
                echo "Found existing cloned neovimfiles"
                echo "Moving to backup location ..."
                echo mv "$dir"{,.bak.$timestamp}
                mv "$dir"{,.bak.$timestamp}
        fi
        if [[ -d "$homedir/.config/nvim" ]] || [[ -L "$homedir/.config/nvim" ]]; then
                echo "Found existing config dir"
                echo "Moving to backup location ..."
                echo mv "$homedir/.config/nvim"{,.bak.$timestamp}
                mv "$homedir/.config/nvim"{,.bak.$timestamp}
        fi
        git clone "$repo_url" "$dir"
        ln -s "$dir/nvim" "$homedir/.config"
        nvim +PlugInstall +UpdateRemotePlugins
}

setup

