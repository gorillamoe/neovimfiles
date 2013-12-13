" There can be only one encoding and it's called UTF8
set encoding=utf-8

" Use Unix as the standard file type
set ff=unix

" Necesary for lots of cool vim things
set nocompatible
filetype off

" Enable Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required! 
Bundle 'gmarik/vundle'

" My bundles
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/matchit.zip'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/taglist.vim'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/UltiSnips'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'Keithbsmiley/investigate.vim'

" Do as Vundle pleases
filetype plugin indent on



" Enable hidden buffers, so we can switch buffers without saving them.
set hidden



" I mostly use this in a terminal, so this will make things look pretty :)
set background=dark



" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed



" Mouse and backspace
set mouse-=a " on OSX press ALT and click
set bs=2 " make backspace behave like normal again



" Rebind <Leader> key
" I like to have it here because it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","



" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>



" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h



" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>



" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation


" Show whitespace
set listchars=tab:>-,trail:-
set list



" Color schemes stuff
set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"



" Color schemes / themes 
" =============================================================================

""" Wombat
""" ----------------------------------------------------
""" http://www.vim.org/scripts/script.php?script_id=2465
""" ===================================================
""" I can't really decide which one I like better.
""" Sometimes I go for wombat and be like: oh wtf.. this is the best
""" theme I can think of .. and then.. suddenly .. I just need a change..
""" .... and then I switch back to molokai .. which is also really good
""" mkdir -p ~/.vim/colors && cd ~/.vim/colors
""" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
""" colorscheme wombat256mod

""" Molokai
""" ----------------------------------------------------
""" https://github.com/tomasr/molokai"
""" ===================================================
""" I really like this theme too and I think powerline / airline
""" just looks awesome with it!
colorscheme molokai



" Enable syntax highlighting
syntax on


" Showing line numbers and length
set number " show line numbers
set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
if exists('+colorcolumn')
    set colorcolumn=80
    highlight ColorColumn ctermbg=233
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif



" Useful settings
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



if has('gui_running')
    set guifont=Sauce\ Code\ Powerline:h10
    set antialias
    "set mouseshape=n:pencil
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
endif


" https://github.com/bling/vim-airline
" A better alternative for the powerline plugin
" Don't forget to download patched fonts and set them as default font
" in your terminal application or in the -has gui running- section.
" ===================================================================
" --- This is a fix for:
" --- vim-airline doesn't appear until i create a new split
set laststatus=2



" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set runtimepath^=~/.vim/bundle/ctrlp.vim



" Quickly turn search highlighting off.
nnoremap <leader>h :nohl<CR>



" Quickly switch between the actual and the last file in the buffer.
nnoremap <leader>, :b#<CR>



" Toggle relative linenumbers on/off
function! g:ToggleRelativeLineNumbers()
    if(&rnu == 1)
        set nornu
    else
        if exists('+relativenumber')
            set rnu
        endif
    endif
endfunc

" Quickly toggle relative numbers on and off
nnoremap <leader>t :call g:ToggleRelativeLineNumbers()<CR>

" Enable relative numbers by default if available
if exists('+relativenumber')
    set rnu
endif



" NERD Tree Binding
nnoremap <leader>k :NERDTreeToggle<CR>



" Search trough cTags
" (index directory by calling ctags -R)
nnoremap <leader>g :CtrlPTag<CR>



" Toogle Tagbar plugin
nnoremap <silent> <Leader>j :TagbarToggle<CR>



" Enable airline powerline fonts
let g:airline_powerline_fonts=1



" Max height of the OnmiCompletionPopup
let g:ctrlp_max_height = 30



" UltiSnips configuration
let g:UltiSnipsSnippetsDir = '~/.vim/snippets/'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'snippets']
