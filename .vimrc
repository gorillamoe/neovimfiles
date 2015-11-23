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
Plug 'tpope/vim-markdown'
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
Plug 'kchmck/vim-coffee-script'
Plug 'lukaszkorecki/CoffeeTags'
Plug 'Yggdroot/indentLine'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-haml'
Plug 'godlygeek/tabular'
Plug 'keith/investigate.vim'
Plug 'jwhitley/vim-literate-coffeescript'

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

" NeoComplete Plugin Configuration
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

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

" UltiSnips Plugin Configuration
let g:UltiSnipsSnippetsDir = "~/.vim/my_snippets"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
" let g:UltiSnipsListSnippets = "<c-k>"
" let g:UltiSnipsExpandTrigger="<F6>"
" let g:UltiSnipsJumpForwardTrigger="<c-n>"
" let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" vim-markdown Plugin Configuration
let g:vim_markdown_folding_disabled=1

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
  set listchars=tab:>-,nbsp:%,extends:>,precedes:<,trail:-
  set list

set t_Co=256
set background=dark

colorscheme wombat256i
let g:airline_theme='wombat'

" Rebind <Leader> key
  let mapleader = ","

" Allow saving of files as sudo when I forgot to start vim using sudo.
  command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Switch Tab vs Spaces
  let g:WalialuUtils_IndentationSwitch = 0
  function! WalialuUtils_IndentationSwitch()
    if g:WalialuUtils_IndentationSwitch == 1
      set expandtab
      let g:WalialuUtils_IndentationSwitch = 0
      let g:syntastic_php_phpcs_args = "--tab-width="
    else
      set noexpandtab
      let g:WalialuUtils_IndentationSwitch = 1
      let g:syntastic_php_phpcs_args = "--standard=CakePHP --tab-width="
    endif
    echo "Indent with Tabs? " . g:WalialuUtils_IndentationSwitch
  endfunc

  nnoremap <F3> :call WalialuUtils_IndentationSwitch()<CR>

  function! g:WalialuUtils_encodeUmlauts()
      " Encodes ü ö ä Ä Ü Ö ß
      :'<,'>s/\Cü/\&uuml;/g
      :'<,'>s/\Cö/\&ouml;/g
      :'<,'>s/\Cä/\&auml;/g
      :'<,'>s/\CÄ/\&Auml;/g
      :'<,'>s/\CÜ/\&Uuml;/g
      :'<,'>s/\CÖ/\&Ouml;/g
      :'<,'>s/ß/\&szlig;/g
  endfunc

let relativenumber = 1

" Awesome line number magic
  function! NumberToggle()
    if(&relativenumber == 1)
      set number
      set norelativenumber
    else
      set relativenumber
    endif
  endfunc

  nnoremap <Leader>l :call NumberToggle()<cr>

" Toggle Vim Hardmode
  nnoremap <Leader>h :call ToggleHardMode()<cr>

" PHP Crap
  nnoremap <F9> :! phpcs --standard=CakePHP %:p<CR>

" Dont mess with paste stuff
  nnoremap <F2> :set paste!<CR>

" Gundo toggle
  nnoremap <F5> :GundoToggle<CR>

" Quicksave command
  noremap <Leader>w :update<CR>
  vnoremap <Leader>w <C-C>:update<CR>
  inoremap <Leader>w <C-O>:update<CR>

" Clear the search buffer when hitting return
:nnoremap <Leader>bd :bd<CR>

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

" Toggle Tagbar plugin
  let g:tagbar_autofocus=1
  nnoremap <silent> <Leader>j :TagbarToggle<CR>

" vim:tabstop=2:expandtab
