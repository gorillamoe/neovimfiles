#!/bin/bash

get_self_repo_dir() {
        user=$(whoami)
        dir="$HOME/Code/$user/neovimfiles"
        echo "$dir"
}

get_nvim_dir() {
        user=$(whoami)
        dir="$HOME/Code/$user/neovimfiles/nvim"
        echo "$dir"
}

get_absolute_packdir() {
        user=$(whoami)
        vimdir=$(get_vim_dir)
        packdir="$dir/nvim/pack/superevil"
        echo "$packdir"
}

get_packdir() {
        packdir="nvim/pack/superevil"
        echo "$packdir"
}

get_initialized_submodules() {
        git submodule foreach --quiet 'echo $name'
}

get_all_submodules() {
        local paths
        local urls
        local path_array
        local url_array
        local path
        local url
        local i=0
        local packname
        local packloadtype
        paths=$(git config --file .gitmodules --get-regexp path | awk '{ print $2 }')
        urls=$(git config --file .gitmodules --get-regexp url | awk '{ print $2 }')
        mapfile -t path_array <<< "$paths"
        mapfile -t url_array <<< "$urls"
        for path in "${path_array[@]}"; do
                url="${url_array[i]}"
                packname=$(basename "$path")
                if [[ "$path" == *"/start/"* ]]; then
                        packloadtype="start"
                else
                        packloadtype="opt"
                fi
                printf "%s\t%s\t%s\n" "$packname" "$packloadtype" "$url"
                i=$((i+1))
        done
}

get_packname() {
        packname=$(basename "$1")
        echo "$packname"
}

update_packs() {
        git submodule update --remote --merge --jobs 4
}

init_packs() {
        if [[ ! -z $1 ]];
	then
		cd "$1"
	fi
	git submodule update --init --recursive --jobs 4
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
        git submodule deinit -f "$clonedir" && git rm "$clonedir" && rm -rf .git/modules/"$clonedir"
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
                if [[ "$1" == "init" ]] || [[ "$1" == "initpacks" ]] ;
                then
                        printf "Init all packs (git submodules).\n\n"
                        init_packs
                fi
        fi
}

setup() {
        repo_url="https://github.com/walialu/neovimfiles"
        user=$(whoami)
        vimdir=$(get_nvim_dir)
        dir=$(get_self_repo_dir)
        packdir="$vimdir/pack/superevil"
        mkdir -p "$dir"
        git clone "$repo_url" "$dir"
        ln -s "$dir/nvim" "$HOME/.config"
        mkdir -p "$packdir/start"
        mkdir -p "$packdir/opt"
        init_packs "$dir"
}

main "$@"

