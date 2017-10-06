let g:python_host_prog='/usr/bin/python2'
let g:python_interpreter='python2'

call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'bling/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'wincent/ferret'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-markdown'
Plug 'airblade/vim-gitgutter'
Plug 'jlanzarotta/bufexplorer'
Plug 'Raimondi/delimitMate'
Plug 'xolox/vim-misc'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'majutsushi/tagbar'
Plug 'editorconfig/editorconfig-vim'
Plug 'sjl/gundo.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-dispatch'
Plug 'keith/investigate.vim'
Plug 'ternjs/tern_for_vim'

call plug#end()

let g:deoplete#enable_at_startup = 1

set wildmode=list:longest " make TAB behave like in a shell
set autoread " reload file when changes happen in other editors
set mouse=a
set bs=2 " make backspace behave like normal again

let $VIMHOME = $HOME."/.config/.nvim"

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

" TagBar CoffeeScript
" @see: https://github.com/majutsushi/tagbar/wiki#coffeescript
let g:tagbar_type_coffee = {
    \ 'ctagstype': 'coffee',
    \ 'kinds': [
        \ 'c:classes',
        \ 'm:methods',
        \ 'f:functions',
        \ 'v:variables',
        \ 'f:fields',
    \ ]
\ }
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

" Enable hidden buffers, so we can switch buffers without saving them.
  set hidden

" Make backspace behave like normal again
  set bs=2 "

" Rebind <Leader> key
  let mapleader = ","

" Bind nohl
  noremap <Leader>n :nohl<CR>

" Enable syntax highlighting
  syntax enable

autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
autocmd FileType litcoffee runtime ftplugin/coffee.vim

" Airline Plugin Configuration
let g:airline_powerline_fonts=1

" CTRLP Plugin Configuration
" do not change working directory each time I invoke ctrlp
let g:ctrlp_working_path_mode = 0
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_height = 30
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|tmp\|dist'
set wildignore+=*tmp/*,*.so,*.swp,*.zip

" indentLine Plugin Configuration
let g:indentLine_fileTypeExclude = ['json']
noremap <Leader>v :IndentLinesToggle<CR>

" Syntastic Plugin Configuration
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_java_javac_classpath = "src/:lib/"

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
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
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

" Show whitespace
  function! Y_showWhitespace()
    set listchars=tab:->,nbsp:%,extends:>,precedes:<,trail:-
    set list
  endfunction
  function! Y_hideWhitespace()
    set nolist
  endfunction
  function! Y_toggleWhitespace()
    set list!
  endfunction


set background=dark

colorscheme onedark

" Allow saving of files as sudo when I forgot to start vim using sudo.
  command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

set relativenumber

" PHP Crap
  nnoremap <F9> :! phpcs --standard=CakePHP %:p<CR>

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

" NERD Tree Binding
nnoremap <LEADER>t :NERDTreeToggle<CR>

" BufExlorer
nnoremap <LEADER>be :BufExplorer<CR>

" Switch buffers
nnoremap <SPACE> :b#<CR>

" Switch buffers
nnoremap <LEADER>nn :nohl<CR>

" investigate.vim binding
  nnoremap <leader>q :call investigate#Investigate()<CR>

" Show tags in CTRLP
  nnoremap <silent> <Leader>j :TagbarToggle<CR>
  " nnoremap <silent> <Leader>j :TagbarToggle<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" vim:tabstop=2:expandtab
