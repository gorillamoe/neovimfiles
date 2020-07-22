call plug#begin('~/.config/nvim/plugged')

Plug 'https://git.superevilmegaco.com/Neovim/AutoRemoteSync.nvim'
Plug 'https://git.superevilmegaco.com/Neovim/Taskfile.nvim'
Plug 'https://git.superevilmegaco.com/Neovim/Clipboard.nvim'
Plug 'https://git.superevilmegaco.com/Neovim/Screenshot.nvim'
Plug 'https://git.superevilmegaco.com/Neovim/InsertSignature.nvim'

Plug 'superevilmegaco/editanywhere.nvim'

" Signify (or just Sy) uses the sign column to indicate added,
" modified and removed lines in a file that is managed by a version control system (VCS).
Plug 'mhinz/vim-signify'

" Interactive code
Plug 'ChristianChiarulli/codi.vim'

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Tmux/Neovim movement integration
Plug 'christoomey/vim-tmux-navigator'

" fzf - Fuzzy finding, buffer management
Plug 'junegunn/fzf'
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

" Gruvbox Theme
Plug 'gruvbox-community/gruvbox'

" Old stuff
Plug 'diepm/vim-rest-console'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'editorconfig/editorconfig-vim'
Plug 'easymotion/vim-easymotion'
Plug 'keith/investigate.vim'
Plug 'joshdick/onedark.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'ludovicchabant/vim-gutentags'

" Initialize plugin system
call plug#end()

" vim:tabstop=8:expandtab
