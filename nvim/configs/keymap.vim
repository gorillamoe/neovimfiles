" Rebind <Leader> key
let mapleader = ","

" Quicksave command
noremap <Leader>w :update<CR>
vnoremap <Leader>w <C-C>:update<CR>
inoremap <Leader>w <C-O>:update<CR>

" Messages shortcut
noremap <Leader>m :messages<CR>

" Indentation
vnoremap < <gv
vnoremap > >gv

" Terminal mapping weird key combo to Esc for command mode
tnoremap <Esc> <C-\><C-n>

" Search for visually selected text by pressing // when in visual mode
vnoremap // y/<C-R>"<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Quick buffer switiching with space bar
nnoremap <space> :b#<CR>

" Bring up Fugitive Vim
nnoremap <silent> <leader>G :G<CR>

" Show Vista VIM / Tag Sidebar
nnoremap <silent> <leader>T :Vista<CR>

" Toggle BufExplorer
nnoremap <silent> <leader>be :ToggleBufExplorer<CR>

" Buffer Delete
nnoremap <Leader>x :bdelete!<CR>

" === Ack.vim shorcuts === "
nnoremap <Leader>g :Ack<Space>

" === fzf shorcuts === "
"   <c-p>      - CtrlP replacment
"   <c-m-p>      - CTRL + Alt/Meta + P - opens the fuzzy finder just for the directory containing the currently edited file
"   <leader>t  - Browse list tags

" Show tags in fzf
nnoremap <silent> <Leader>j :Tags<CR>

" Show local tags in fzf
nnoremap <silent> <Leader>t :BTags<CR>

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

" === Nerdtree shorcuts === "
"  <leader>n - Toggle NERDTree on/off
"  <leader>f - Opens current file location in NERDTree
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>. :NERDTreeFind<CR>

" === coc.nvim === "
nmap <silent> <leader>E :CocList diagnostics<CR>
nmap <silent> <leader>e :CocList diagnostics<CR>
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)

" === vim-better-whitespace === "
"   <leader>y - Automatically remove trailing whitespace
nmap <leader>y :StripWhitespace<CR>

" === Search shorcuts === "
"   <leader>h - Find and replace
"   <leader>/ - Clear highlighted search terms while preserving history
map <leader>h :%s///<left><left>
nmap <silent> <leader>/ :nohlsearch<CR>

" === Easy-motion shortcuts ==="
"   <leader>w - Easy-motion highlights first word letters bi-directionally
map <leader>f <Plug>(easymotion-bd-w)

" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %

" === vim-jsdoc shortcuts ==="
" Generate jsdoc for function under cursor
nmap <leader>z :JsDoc<CR>

" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap <leader>p "_dP

" vim:tabstop=8:expandtab
