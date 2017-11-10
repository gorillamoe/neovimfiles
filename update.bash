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
        packdir="$dir/vim/pack/superevil"
        echo "$packdir"
}

get_packdir() {
        packdir="vim/pack/superevil"
        echo "$packdir"
}

get_initialized_submodules() {
        git submodule foreach --quiet 'echo $name'
}

get_all_submodules() {
        git config --file .gitmodules --get-regexp path | awk '{ print $2 }'
}

get_packname() {
        packname=$(basename "$1")
        echo "$packname"
}

update_packs() {
        git submodule update --remote --merge
}

add_pack() {
        repo_url="https://github.com/$1"
        packdir=$(get_packdir)
        packname=$(get_packname "$1")
        clonedir="$packdir/$2/$packname"
        git submodule add "$repo_url" "$clonedir" && git add .gitmodules "$clonedir"
}

rm_pack() {
        repo_url="https://github.com/$1"
        packdir=$(get_packdir)
        packname=$(get_packname "$1")
        clonedir="$packdir/$2/$packname"
        git submodule deinit "$clonedir" && git rm "$clonedir" && rm -rf .git/modules/"$clonedir"
}

main() {
        if [[ -z $1 ]];
        then
                vimdir=$(get_self_repo_dir)
                if [ ! -d "$vimdir" ]; then
                        setup
                else
                        echo "Updating all packages."
                        update_packs
                fi
        else
                if [[ "$1" == "add" ]];
                then
                        printf "Add package %s to %s.\n\n" "$2" "$3"
                        add_pack "$2" "$3"
                fi
                if [[ "$1" == "rm" ]];
                then
                        printf "Remove package %s from %s.\n\n" "$2" "$3"
                        rm_pack "$2" "$3"
                fi
                if [[ "$1" == "ls" ]] || [[ "$1" == "list" ]] ;
                then
                        printf "Listing all initialized packages.\n\n"
                        get_initialized_submodules
                fi
                if [[ "$1" == "lsa" ]] || [[ "$1" == "listall" ]] ;
                then
                        printf "Listing all available packages.\n\n"
                        get_all_submodules
                fi
        fi
}

setup() {
        repo_url="https://github.com/walialu/vimfiles"
        user=$(whoami)
        vimdir=$(get_vim_dir)
        dir=$(get_self_repo_dir)
        neovimdir="$dir/.config/nvim"
        packdir="$vimdir/pack/superevil"
        mkdir -p "$dir"
        git clone "$repo_url" "$dir"
        ln -s "$dir/vim" "$HOME/.vim"
        ln -s "$dir/vimrc" "$HOME/.vimrc"
        if [ ! -d "$neovimdir" ]; then
                ln -s "$dir/vim" "$neovimdir"
                ln -s "$dir/vimrc" "$neovimdir/init.vim"
        fi
        mkdir -p "$packdir/start"
        mkdir -p "$packdir/opt"
        update_packs
}

main "$@"

