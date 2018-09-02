call plug#begin('~/.config/nvim/plugged')

Plug 'https://github.com/superevilmegaco/OpenUrl.nvim'
Plug 'https://git.superevilmegaco.com/Neovim/AutoRemoteSync.nvim'
Plug 'https://git.superevilmegaco.com/Neovim/Taskfile.nvim'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/junegunn/goyo.vim'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'https://github.com/vim-scripts/matchit.zip'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-unimpaired'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/wincent/ferret'
Plug 'https://github.com/godlygeek/tabular'
Plug 'https://github.com/tpope/vim-markdown', { 'for': 'markdown' }
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/jlanzarotta/bufexplorer'
Plug 'https://github.com/Raimondi/delimitMate'
Plug 'https://github.com/xolox/vim-misc'
Plug 'https://github.com/MarcWeber/vim-addon-mw-utils'
Plug 'https://github.com/tomtom/tlib_vim'
Plug 'https://github.com/majutsushi/tagbar'
Plug 'https://github.com/editorconfig/editorconfig-vim'
Plug 'https://github.com/sjl/gundo.vim'
Plug 'https://github.com/Lokaltog/vim-easymotion'
Plug 'https://github.com/tpope/vim-dispatch'
Plug 'https://github.com/keith/investigate.vim'
Plug 'https://github.com/ternjs/tern_for_vim'
Plug 'https://github.com/Shougo/deoplete.nvim'
Plug 'https://github.com/joshdick/onedark.vim'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/mxw/vim-jsx'
Plug 'https://github.com/mattn/emmet-vim'
Plug 'https://github.com/w0rp/ale'
Plug 'https://github.com/skywind3000/asyncrun.vim'
Plug 'https://github.com/aanari/vim-tsx-pretty'
Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'https://github.com/peitalin/vim-jsx-typescript'
Plug 'https://github.com/mustache/vim-mustache-handlebars'
Plug 'https://github.com/fatih/vim-go', { 'for': 'go' }
Plug 'https://github.com/tpope/vim-dadbod'
Plug 'https://github.com/cespare/vim-toml', { 'for': 'toml' }
Plug 'https://github.com/SirVer/ultisnips'
Plug 'https://github.com/honza/vim-snippets'
Plug 'https://github.com/zchee/deoplete-go'
Plug 'https://github.com/carlitux/deoplete-ternjs'
Plug 'https://github.com/StanAngeloff/php.vim', { 'for': 'php' }
Plug 'https://github.com/tpope/vim-eunuch'
Plug 'https://github.com/chr4/nginx.vim'

let g:deoplete#enable_at_startup = 1

call plug#end()

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

let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
                \ 'p:package',
                \ 'i:imports:1',
                \ 'c:constants',
                \ 'v:variables',
                \ 't:types',
                \ 'n:interfaces',
                \ 'w:fields',
                \ 'e:embedded',
                \ 'm:methods',
                \ 'r:constructor',
                \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
                \ 'ctype' : 't',
                \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
\ }

" Emmet
" Also for React jsx files
let g:user_emmet_settings = {
    \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" Every time I save a JS file, (asynchronously) run `eslint --fix` on this file
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

" Ale
" Make it more pleasing to my eyes
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '∙'
let g:ale_lint_on_enter = 1 " Enforce linting on opening up a file
let g:ale_fix_on_save = 1 " Force ale_fixers on save / :ALEFix
" Also specify linters
" Requires:
" ```
" npm i -g eslint && npm i -g eslint-plugin-react
" npm i -g prettier
" npm i -g tslint
" npm i -g csslint
" wget https://cs.sensiolabs.org/download/php-cs-fixer-v2.phar -O php-cs-fixer && \
" sudo chmod a+x php-cs-fixer && \
" sudo mv php-cs-fixer /usr/local/bin/php-cs-fixer
" ```
let g:ale_linters = {
        \'javascript': ['eslint'],
        \'typescript': ['tslint', 'tsserver'],
        \'typescript.jsx': ['tslint', 'tsserver'],
        \'csslint': ['csslint'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'tslint'],
\   'typescript.jsx': ['prettier', 'tslint'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'php': ['php_cs_fixer'],
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

" Enable true color support
if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        set termguicolors
endif

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
set smartindent

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

colorscheme onedark
let g:airline_theme='onedark'
" vim:tabstop=8:expandtab
