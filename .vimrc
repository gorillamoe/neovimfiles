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
    Bundle 'pangloss/vim-javascript'
    Bundle 'heavenshell/vim-jsdoc'


if has('win32') || has ('win64')
  let $VIMHOME = $VIM."/vimfiles"
else
  let $VIMHOME = $HOME."/.vim"
endif

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

" Real programmers use spaces instead of tabs.
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
    set expandtab

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

" Showing line numbers and length
    set number " show line numbers
    set tw=79 " width of document
    set nowrap " don't automatically wrap on load
    set fo-=t " don't automatically wrap text when typing

    " Show bar for length
        if exists('+colorcolumn')
            set colorcolumn=80
            highlight ColorColumn ctermbg=233
        endif

    " Enable relative numbers by default if available
        if exists('+relativenumber')
            set rnu
        endif

" Show whitespace
    set listchars=tab:>-,trail:-
    set list

" Colors
    let g:solarized_termcolors=256
    set t_Co=256
    set background=light
    colorscheme wombat256mod
    highlight ColorColumn ctermbg=233

    let g:current_colorscheme = 0
    function! ToggleColorscheme()
        if (g:current_colorscheme == 0)
            set background=light
            colorscheme solarized
            let g:current_colorscheme=1
        else
            set background=dark
            colorscheme wombat256mod
            let g:current_colorscheme=0
            highlight ColorColumn ctermbg=233
        endif
    endfunction

" Auto-Commands
if !exists("my_auto_commands_loaded")
    let my_auto_commands_loaded = 1
    " Sets filetype to markdown for .md files
    au BufRead,BufNewFile *.md set filetype=markdown
    au FileType php setlocal noexpandtab


    " Large files > 10M
    let g:LargeFile = 1024 * 1024 * 10
    augroup LargeFile
        autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | endif
    augroup END
endif



" Protect large files from sourcing and other overhead.
" Files become read only
if !exists("my_auto_commands_loaded")
  let my_auto_commands_loaded = 1
  " Large files are > 10M
  " Set options:
  " eventignore+=FileType (no syntax highlighting etc
  " assumes FileType always on)
  " noswapfile (save copy of file)
  " bufhidden=unload (save memory when other file is viewed)
  " buftype=nowritefile (is read-only)
  " undolevels=-1 (no undo possible)
  let g:LargeFile = 1024 * 1024 * 10
  augroup LargeFile
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
    augroup END
endif


source $VIMHOME/keymap.vim
source $VIMHOME/conf/airline.vim
source $VIMHOME/conf/ctrlp.vim
source $VIMHOME/conf/syntastic.vim
source $VIMHOME/conf/ultisnips.vim
