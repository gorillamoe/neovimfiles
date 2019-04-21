" disabling line numbers and length
set nonumber
" disabling relative line numbers
set norelativenumber

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

" Don't dispay mode in command line (airilne already shows it)
set noshowmode

colorscheme onedark


" vim:tabstop=8:expandtab
