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

" Enable hidden buffers, so we can switch buffers without saving them.
set hidden

" Enable syntax highlighting
syntax enable

" Airline Plugin Configuration
let g:airline_powerline_fonts=1

" Tern Plugin Configuration
" disable preview window for tern_for_vim
set completeopt-=preview

" Real programmers use tabs instead of spaces.
set tabstop=8
set shiftwidth=8
set softtabstop=8
set noexpandtab


set autoindent
set smartindent

" vim:tabstop=8:expandtab
