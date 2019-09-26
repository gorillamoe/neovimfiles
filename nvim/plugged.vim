call plug#begin('~/.config/nvim/plugged')

Plug 'https://git.superevilmegaco.com/Neovim/AutoRemoteSync.nvim'
Plug 'https://git.superevilmegaco.com/Neovim/Taskfile.nvim'
Plug 'https://git.superevilmegaco.com/Neovim/Clipboard.nvim'
Plug 'https://git.superevilmegaco.com/Neovim/Screenshot.nvim'
Plug 'https://git.superevilmegaco.com/Neovim/InsertSignature.nvim'

" Fuck these fucking fuckers who want to hack our beautiful computers through
" the fucked up modeline support
Plug 'ciaranm/securemodelines'

" UndoTree - The undo history visualizer for VIM
Plug 'mbbill/undotree'

" BufExplorer - Buffers on steroids
Plug 'jlanzarotta/bufexplorer'

" Tabularize - Aligning on steroids
Plug 'godlygeek/tabular'

" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'

" Ack vim / The silver surfer / Ag, ag
Plug 'mileszs/ack.vim'

" Intellisense Engine
" Plug 'neoclide/coc.nvim', { 'do': 'yarn install' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Tmux/Neovim movement integration
Plug 'christoomey/vim-tmux-navigator'

" fzf - Fuzzy finding, buffer management
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'

" Snippet support
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Print function signatures in echo area
Plug 'Shougo/echodoc.vim'

" === Git Plugins === "
Plug 'tpope/vim-fugitive'

" Generate JSDoc commands based on function signature
Plug 'heavenshell/vim-jsdoc'

" === Syntax Highlighting === "

" Typescript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'

" ReactJS JSX syntax highlighting
Plug 'mxw/vim-jsx'

" Syntax highlighting for nginx
Plug 'chr4/nginx.vim'

" Syntax highlighting for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim'

" Improved syntax highlighting and indentation
Plug 'othree/yajs.vim'

" === UI === "
" File explorer
Plug 'scrooloose/nerdtree'

" Customized vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Tagbar replacement
Plug 'liuchengxu/vista.vim'

" Quickly swapping text with visual mode and motion command cx
Plug 'tommcdo/vim-exchange'

" Old stuff
Plug 'https://github.com/diepm/vim-rest-console'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-unimpaired'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/plasticboy/vim-markdown', { 'for': 'markdown' }
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
