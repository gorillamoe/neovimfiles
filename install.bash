#!/bin/bash

setup() {
        repo_url="git@git.superevilmegaco.com:marco/neovimfiles.git"
        user=$(whoami)
        vimdir=$(get_nvim_dir)
        dir=$(get_self_repo_dir)
        packdir="$vimdir/pack/superevil"
        mkdir -p "$dir"
        git clone "$repo_url" "$dir"
        ln -s "$dir/nvim" "$HOME/.config"
        mkdir -p "$packdir/start"
        mkdir -p "$packdir/opt"
        nvim +PlugInstall
}

setup

