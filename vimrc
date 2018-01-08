let g:python_host_prog='/usr/bin/python2'
let g:python_interpreter='python2'
let g:deoplete#enable_at_startup = 1

set wildmode=list:longest " make TAB behave like in a shell
set autoread " reload file when changes happen in other editors
set mouse=a
set bs=2 " make backspace behave like normal again

let $VIMHOME = $HOME."/.vim"

" make yank copy to the global system clipboard
set clipboard=unnamedplus

" Make history go insane, but safe my sanity
set history=700
set undolevels=700

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" TagBar Markdown
" @see: https://github.com/majutsushi/tagbar/wiki#markdown
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
  \ }

" Emmet
" Also for React jsx files
let g:user_emmet_settings = {
    \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" Enable hidden buffers, so we can switch buffers without saving them.
set hidden

" Rebind <Leader> key
let mapleader = ","

" Bind nohl
noremap <Leader>n :nohl<CR>

" Enable syntax highlighting
syntax enable

" Airline Plugin Configuration
let g:airline_powerline_fonts=1

" CTRLP Plugin Configuration
" do not change working directory each time I invoke ctrlp
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 30
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|tmp\|dist'

" indentLine Plugin Configuration
let g:indentLine_fileTypeExclude = ['json']
noremap <Leader>v :IndentLinesToggle<CR>

" TagBar Plugin Configuration
let g:tagbar_foldlevel = 0 "close tagbar folds by default
let g:tagbar_sort = 0 "tagbar shows tags in order of they created in file
let g:tagbar_autofocus = 1

" Tern Plugin Configuration
" disable preview window for tern_for_vim
set completeopt-=preview

" vim-markdown Plugin Configuration
let g:vim_markdown_conceal = 0
let g:markdown_syntax_conceal = 0

" Real programmers use spaces instead of tabs.
set tabstop=8
set shiftwidth=8
set softtabstop=8
set expandtab

" Showing line numbers and length
set number
set tw=79 " width of document
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing

" Show bar for length
if exists('+colorcolumn')
        set colorcolumn=80
        highlight ColorColumn ctermbg=233
endif

" Allow saving of files as sudo when I forgot to start vim using sudo.
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

set relativenumber

" Gundo toggle
nnoremap <F5> :GundoToggle<CR>

" Quicksave command
noremap <Leader>w :update<CR>
vnoremap <Leader>w <C-C>:update<CR>
inoremap <Leader>w <C-O>:update<CR>

" Quick CTags generation command
" see: https://github.com/mislav/cstags
noremap <Leader>r :!cstags -f .git/tags %<CR><CR>

" Indentation
vnoremap < <gv
vnoremap > >gv
set autoindent

" NERD Tree Binding
nnoremap <LEADER>t :NERDTreeToggle<CR>

" BufExlorer
nnoremap <LEADER>be :BufExplorer<CR>

" Switch buffers
nnoremap <SPACE> :b#<CR>

" Disable highlighting
nnoremap <LEADER>nn :nohl<CR>

" OpenUrl.nvim binding
nnoremap <leader>q :call OpenUrl#UnderCursor()<CR>
" Use keith/investigate.vim as a fallback, if it's not an URL
let g:OpenUrl_DarkInvestigate = 1

" Show tags in CTRLP
nnoremap <silent> <Leader>j :TagbarToggle<CR>

" The Silver Searcher
if executable('ag')
        " Use ag over grep
        set grepprg=ag\ --nogroup\ --nocolor

        " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

        " ag is fast enough that CtrlP doesn't need to cache
        let g:ctrlp_use_caching = 0
endif

if has('nvim')
        " Terminal mode:
        tnoremap <Esc> <C-\><C-n>
        tnoremap <M-[> <Esc>
        tnoremap <C-v><Esc> <Esc>
        tnoremap <M-h> <c-\><c-n><c-w>h
        tnoremap <M-j> <c-\><c-n><c-w>j
        tnoremap <M-k> <c-\><c-n><c-w>k
        tnoremap <M-l> <c-\><c-n><c-w>l
        " Insert mode:
        inoremap <M-h> <Esc><c-w>h
        inoremap <M-j> <Esc><c-w>j
        inoremap <M-k> <Esc><c-w>k
        inoremap <M-l> <Esc><c-w>l
        " Visual mode:
        vnoremap <M-h> <Esc><c-w>h
        vnoremap <M-j> <Esc><c-w>j
        vnoremap <M-k> <Esc><c-w>k
        vnoremap <M-l> <Esc><c-w>l
        " Normal mode:
        nnoremap <M-h> <c-w>h
        nnoremap <M-j> <c-w>j
        nnoremap <M-k> <c-w>k
        nnoremap <M-l> <c-w>l
endif

" Load optional onedark.vim colorscheme
packadd! onedark.vim

colorscheme onedark
let g:airline_theme='onedark'

" vim:tabstop=8:expandtab
