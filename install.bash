#!/bin/bash

__python_pip2_module_installed() {
        local err=$(python2.7 -c "import $1")
        if [[ -z $err ]]; then
                echo 1
        else
                echo 0
        fi
}

__python_pip_module_installed() {
        local err=$(python -c "import $1")
        if [[ -z $err ]]; then
                echo 1
        else
                echo 0
        fi
}

__command_exists() {
        local exists=$(command -v "$1")
        # command does not exist
        if [[ -z $exists ]]; then
                echo 0
        else # command exists
                echo 1
        fi
}

__check_requirements() {
        if [[ $(__command_exists "python") == 0 ]]; then
                echo "Python 3 is required"
                exit 1
        fi
        if [[ $(__command_exists "python2.7") == 0 ]]; then
                echo "Python 2.7 is required"
                exit 2
        fi
        if [[ $(__python_pip2_module_installed "neovim") == 0 ]]; then
                echo "Neovim library for Python 2.7 required"
                echo "Install (on Arch) with `yay -S python2-neovim`"
                exit 3
        fi
        if [[ $(__python_pip_module_installed "neovim") == 0 ]]; then
                echo "Neovim library for Python 3 required"
                echo "Install (on Arch) with `yay -S python-neovim`"
                exit 4
        fi
        if [[ $(__command_exists "ruby") == 0 ]]; then
                echo "Ruby is required"
                echo "Install (on Arch) with `yay -S ruby ruby-neovim`"
                exit 5
        fi
        if [[ $(__command_exists "npm") == 0 ]]; then
                echo "Nodejs (npm) is required"
                exit 6
        fi
}

setup() {
        local repo_url="https://git.superevilmegaco.com/marco/neovimfiles"
        local user=$(whoami)
        local homedir=$(getent passwd "$user" | cut -d: -f6)
        local dir="$homedir/code/$user/neovimfiles"
        local timestamp=$(date +%s)
        __check_requirements
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

