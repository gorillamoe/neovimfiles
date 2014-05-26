" We don't want to be in compliance mode with Vi
  set nocompatible
  filetype off

" Enable Vundle
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  Bundle 'gmarik/vundle'

" My bundles
  Bundle 'kien/ctrlp.vim'
  Bundle 'vim-scripts/matchit.zip'
  Bundle 'scrooloose/nerdtree'
  Bundle 'scrooloose/syntastic'
  Bundle 'bling/vim-airline'
  Bundle 'tpope/vim-commentary'
  Bundle 'tpope/vim-repeat'
  Bundle 'tpope/vim-surround'
  Bundle 'tpope/vim-unimpaired'
  Bundle 'SirVer/ultisnips'
  Bundle 'honza/vim-snippets'
  Bundle 'jlanzarotta/bufexplorer'
  Bundle 'sjl/gundo.vim'
  Bundle 'Valloric/YouCompleteMe'
  Bundle 'marijnh/tern_for_vim'
  Bundle 'terryma/vim-multiple-cursors'
  Bundle 'Raimondi/delimitMate'

set tags=./tags
set wildmode=list:longest " make TAB behave like in a shell
set autoread " reload file when changes happen in other editors
set mouse=a
set bs=2 " make backspace behave like normal again

if has('win32') || has ('win64')
  let $VIMHOME = $VIM."/vimfiles"
else
  let $VIMHOME = $HOME."/.vim"
endif

" make yank copy to the global system clipboard
  set clipboard=unnamed

" Neocomplete Setup
  let g:neocomplete#enable_at_startup = 1

" Check if various external libraries / apps / programs are available
" =============================================================================
" http://stackoverflow.com/questions/10068078/how-to-detect-os-type-and-set-ctags-path-in-vimrc
" Because some plugins rely on them ..
" Also some of my key mappings to these plugins are then not needed anymore.
" This is heavily inspired by a great answer I found on stackoverflow:
  if executable('exctags')
      let external_lib_is_available_ctags = 1
  elseif executable('ctags')
      let external_lib_is_available_ctags = 1
  else
      let external_lib_is_available_ctags = 0
  endif

" This plugins depend on external libs, therefore I include them conditionally
  if ( external_lib_is_available_ctags == 1 )
      Bundle 'majutsushi/tagbar'
      Bundle 'vim-scripts/taglist.vim'
  endif

" Set encoding
  set encoding=utf-8

" Use Unix as the standard file type
  set ff=unix

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

" Enable indentation
  filetype plugin indent on

" Enable hidden buffers, so we can switch buffers without saving them.
  set hidden

" Fix for ViM Airline Plugin
  set laststatus=2

" Make backspace behave like normal again
  set bs=2 "

" Enable syntax highlighting
  syntax enable

source $VIMHOME/conf/airline.vim
source $VIMHOME/conf/ctrlp.vim
source $VIMHOME/conf/syntastic.vim
source $VIMHOME/conf/ultisnips.vim
source $VIMHOME/indentation.vim
source $VIMHOME/colors.vim
source $VIMHOME/keymap.vim
" vim:tabstop=2:expandtab
