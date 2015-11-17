" We don't want to be in compliance mode with Vi
  set nocompatible
  filetype off

call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jlanzarotta/bufexplorer'
Plug 'marijnh/tern_for_vim', { 'for': 'javascript' }
Plug 'Raimondi/delimitMate'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'editorconfig/editorconfig-vim'
Plug 'sjl/gundo.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'kchmck/vim-coffee-script' , { 'for': 'coffee' }
Plug 'lukaszkorecki/CoffeeTags', { 'for': 'coffee' }
Plug 'Yggdroot/indentLine'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-haml'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()

filetype plugin indent on

if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif

let g:neocomplcache_force_omni_patterns.java = '\k\.\k*'

set tags=./tags
set wildmode=list:longest " make TAB behave like in a shell
set autoread " reload file when changes happen in other editors
set mouse=a
set bs=2 " make backspace behave like normal again

let $VIMHOME = $HOME."/.vim"

" make yank copy to the global system clipboard
  set clipboard=unnamedplus

" Neocomplete Setup
  let g:neocomplete#enable_at_startup = 1

" Set encoding
  set encoding=utf-8

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

" Bind nohl
  noremap <Leader>h :nohl<CR>

" Enable hidden buffers, so we can switch buffers without saving them.
  set hidden

" Fix for ViM Airline Plugin
  set laststatus=2

" Make backspace behave like normal again
  set bs=2 "

" Enable syntax highlighting
  syntax enable

autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" For 'hail2u/vim-css3-syntax' Plugin
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END
for f in split(glob("$VIMHOME/conf/*.vim"), '\n')
  exe 'source' f
endfor
source $VIMHOME/indentation.vim
source $VIMHOME/colors.vim
source $VIMHOME/keymap.vim
