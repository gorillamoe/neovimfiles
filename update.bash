#!/bin/bash

get_self_repo_dir() {
        user=$(whoami)
        dir="$HOME/Code/$user/vimfiles"
        echo "$dir"
}

get_vim_dir() {
        user=$(whoami)
        dir="$HOME/Code/$user/vimfiles/.vim"
        echo "$dir"
}

get_absolute_packdir() {
        user=$(whoami)
        vimdir=$(get_vim_dir)
        packdir="$dir/.vim/pack/superevil"
        echo "$packdir"
}

get_packdir() {
        packdir=".vim/pack/superevil"
        echo "$packdir"
}

update_packs() {
        git submodule update --remote --merge
}

add_pack() {
        repo_url="https://github.com/$1"
        packdir=$(get_packdir)
        clonedir="$packdir/$2/$1"
        git submodule add "$repo_url" "$clonedir" && git add .gitmodules "$clonedir"
}

rm_pack() {
        repo_url="https://github.com/$1"
        packdir=$(get_packdir)
        clonedir="$packdir/$2/$1"
        git submodule deinit "$clonedir" && git rm "$clonedir" && rm -rf .git/modules/"$clonedir"
}

main() {
        if [[ -z $1 ]];
        then
                vimdir=$(get_self_repo_dir)
                if [ ! -d "$vimdir" ]; then
                        setup
                else
                        echo "Updating all packages"
                        update_packs
                fi
        else
                if [[ "$1" == "add" ]];
                then
                        echo "Add package $2 to $3 "
                        add_pack "$2" "$3"
                fi
                if [[ "$1" == "rm" ]];
                then
                        echo "Remove package $2 from $3 "
                        rm_pack "$2" "$3"
                fi
        fi
}

setup() {
        repo_url="https://github.com/walialu/vimfiles"
        user=$(whoami)
        vimdir=$(get_vim_dir)
        dir=$(get_self_repo_dir)
        packdir="$vimdir/pack/superevil"
        mkdir -p "$dir"
        git clone "$repo_url" "$dir"
        ln -s "$dir/.vim" "$HOME/.vim"
        ln -s "$dir/.vimrc" "$HOME/.vimrc"
        mkdir -p "$packdir/start"
        mkdir -p "$packdir/opt"
}

main "$@"

