#!/bin/bash

main() {
        repo_url="https://github.com/walialu/vimfiles"
        user=$(whoami)
        dir="$HOME/Code/$user/vimfiles"
        packdir="$dir/.vim/pack/superevil"
        mkdir -p "$dir"
        git clone "$repo_url" "$dir"
        ln -s "$dir/.vim" "$HOME/.vim"
        ln -s "$dir/.vimrc" "$HOME/.vimrc"
        mkdir -p "$packdir/start"
        mkdir -p "$packdir/opt"
}
