" Setting very basic, but important stuff first
" =============================================================================
" There can be only one encoding and it's called UTF8
set encoding=utf-8

" Use Unix as the standard file type
set ff=unix

" Make history go insane, but safe my sanity
set history=700
set undolevels=700

" Real programmers use spaces instead of tabs.
set tabstop=4
set shiftwidth=4
set softtabstop=4
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

" We don't want to be in compliance mode with Vi
set nocompatible
filetype off

" Enable indentation
filetype plugin indent on

" Enable hidden buffers, so we can switch buffers without saving them.
set hidden

" Rebind <Leader> key
let mapleader = ","

" Fix for ViM Airline Plugin
set laststatus=2

" Make backspace behave like normal again
set bs=2 "

" Colors
set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
set background=dark
colors wombat256mod

" Enable syntax highlighting
syntax on

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

" Check if various external libraries / apps / programs are available
" =============================================================================
" Because some plugins rely on them ..
" Also some of my key mappings to these plugins are then not needed anymore.
" This is heavily inspired by a great answer I found on stackoverflow:
" http://stackoverflow.com/questions/10068078/how-to-detect-os-type-and-set-ctags-path-in-vimrc
"

if executable('exctags')
    let external_lib_is_available_ctags = 1
elseif executable('ctags')
    let external_lib_is_available_ctags = 1
else
    let external_lib_is_available_ctags = 0
endif

if executable('npm')
    let external_lib_is_available_npm = 1
else
    let external_lib_is_available_npm = 0
endif



" Enable Vundle
" =============================================================================
"
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'google/maktaba'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/matchit.zip'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Bundle 'jlanzarotta/bufexplorer'
Bundle 'ervandew/ag'


" This plugins depend on external libs, therefore I include them conditionally
"
if ( external_lib_is_available_npm == 1 )
    Bundle 'marijnh/tern_for_vim'
endif

if ( external_lib_is_available_ctags == 1 )
    Bundle 'majutsushi/tagbar'
    Bundle 'vim-scripts/taglist.vim'
endif



" Plugin settings
" =============================================================================
"

" Settings for ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Enable airline powerline fonts
let g:airline_powerline_fonts=1

" Max height of the OnmiCompletionPopup
let g:ctrlp_max_height = 30



" Autocommands
" =============================================================================
"
au BufRead,BufNewFile *.md set filetype=markdown


" Keymappings
" =============================================================================
"

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Window navigation
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Indentation
vnoremap < <gv
vnoremap > >gv

" Quickly switch between the actual and the last file in the buffer.
nnoremap <leader>, :b#<CR>

" NERD Tree Binding
nnoremap <leader>k :NERDTreeToggle<CR>

if ( external_lib_is_available_ctags == 1 )
    " Search through cTags
    nnoremap <leader>g :CtrlPTag<CR>
    " Toogle Tagbar plugin
    nnoremap <silent> <Leader>j :TagbarToggle<CR>
endif
