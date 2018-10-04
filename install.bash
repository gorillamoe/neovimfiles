#!/bin/bash

setup() {
        local repo_url="git@git.superevilmegaco.com:marco/neovimfiles.git"
        local user=$(whoami)
        local dir="$HOME/code/$user/neovimfiles"
        git clone "$repo_url" "$dir"
        ln -s "$dir/nvim" "$HOME/.config"
        nvim +PlugInstall +UpdateRemotePlugins
}

setup

