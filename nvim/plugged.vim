call plug#begin('~/.config/nvim/plugged')

Plug 'https://git.superevilmegaco.com/Neovim/AutoRemoteSync.nvim'
Plug 'https://git.superevilmegaco.com/Neovim/Taskfile.nvim'
Plug 'https://git.superevilmegaco.com/Neovim/Clipboard.nvim'
Plug 'https://git.superevilmegaco.com/Neovim/Screenshot.nvim'

" Ack vim / The silver surfer / Ag, ag
Plug 'mileszs/ack.vim'

" Intellisense Engine
" Plug 'neoclide/coc.nvim', { 'do': 'yarn install' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Tmux/Neovim movement integration
Plug 'christoomey/vim-tmux-navigator'

" Denite - Fuzzy finding, buffer management
Plug 'Shougo/denite.nvim'

" Snippet support
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Print function signatures in echo area
Plug 'Shougo/echodoc.vim'

" === Git Plugins === "
" Enable git changes to be shown in sign column
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'


" ReactJS JSX syntax highlighting
Plug 'mxw/vim-jsx'

" Generate JSDoc commands based on function signature
Plug 'heavenshell/vim-jsdoc'

" === Syntax Highlighting === "

" Syntax highlighting for nginx
Plug 'chr4/nginx.vim'

" Syntax highlighting for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim'

" Improved syntax highlighting and indentation
Plug 'othree/yajs.vim'

" === UI === "
" File explorer
Plug 'scrooloose/nerdtree'

" Colorscheme
Plug 'mhartington/oceanic-next'

" Customized vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'


" Old stuff
Plug 'https://github.com/diepm/vim-rest-console'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-unimpaired'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/plasticboy/vim-markdown', { 'for': 'markdown' }
" Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/editorconfig/editorconfig-vim'
Plug 'https://github.com/easymotion/vim-easymotion'
Plug 'https://github.com/keith/investigate.vim'
Plug 'https://github.com/joshdick/onedark.vim'
Plug 'https://github.com/mustache/vim-mustache-handlebars'
Plug 'https://github.com/fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'https://github.com/cespare/vim-toml', { 'for': 'toml' }
Plug 'https://github.com/StanAngeloff/php.vim', { 'for': 'php' }
Plug 'https://github.com/ludovicchabant/vim-gutentags'

" Initialize plugin system
call plug#end()

" vim:tabstop=8:expandtab
