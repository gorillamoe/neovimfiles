" disabling line numbers and length
set number
" disabling relative line numbers
set relativenumber

set nowrap " do not wrap text

" Enable true color support
if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        set termguicolors
endif

" Don't dispay mode in command line (airilne already shows it)
set noshowmode

" Highlight current line
set cursorline

colorscheme gruvbox

" vim:tabstop=8:expandtab
