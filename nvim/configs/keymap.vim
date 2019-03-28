" Rebind <Leader> key
let mapleader = ","

" Bind nohl
noremap <Leader>n :nohl<CR>

" Quicksave command
noremap <Leader>w :update<CR>
vnoremap <Leader>w <C-C>:update<CR>
inoremap <Leader>w <C-O>:update<CR>

" Messages shortcut
noremap <Leader>m :messages<CR>

" Indentation
vnoremap < <gv
vnoremap > >gv

" Allow saving of files as sudo when I forgot to start vim using sudo.
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" NERDTree
nnoremap <LEADER>e :NERDTreeToggle<CR>

" BufExlorer
nnoremap <LEADER>be :BufExplorer<CR>

" Switch buffers
nnoremap <SPACE> :b#<CR>

" Buffer Delete
nnoremap <Leader>x :bdelete<CR>

" vim-fugitive config start

nnoremap <silent> <leader>g :G<CR>

" vim-fugitive config end

" Show tags in tagbar
nnoremap <silent> <Leader>T :TagbarToggle<CR>

" fzf config start

" Show tags in fzf
nnoremap <silent> <Leader>j :Tags<CR>

" Show local tags in fzf
nnoremap <silent> <Leader>t :BTags<CR>

" Quickly switch to open buffer
nnoremap <silent> <leader>b :Buffers<CR>

" Replacement for ctrlp
nnoremap <silent> <C-p> :Files<CR>
" CTRL + ALT(meta) + p will open the fuzzy finder just for the directory containing the currently edited file
nnoremap <silent> <C-M-p> :Files <C-r>=expand("%:h")<CR>/<CR>

" Fuzzy search for Git commits. Requires tpope/vim-fugitive
let g:fzf_commits_log_options = '--graph --color=always
  \ --format="%C(yellow)%h%C(red)%d%C(reset)
  \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

nnoremap <silent> <leader>c  :Commits<CR>
nnoremap <silent> <leader>bc :BCommits<CR>

" Ripgrep shorthand commands
nnoremap <leader>rg :Rg<Space>
nnoremap <leader>!  :Rg!<Space>

" fzf config end

" vim:tabstop=8:expandtab
