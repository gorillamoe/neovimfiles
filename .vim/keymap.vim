" Rebind <Leader> key
    let mapleader = ","

" Allow saving of files as sudo when I forgot to start vim using sudo.
    cmap w!! w !sudo tee > /dev/null %

let g:UltiSnipsExpandTrigger="<c-k>"


nnoremap <F8> :call ToggleColorscheme()<CR>
nnoremap <F9> :! phpcs --standard=CakePHP %:p<CR>

nnoremap <F2> :set paste!<CR>

" remap :wq to :w :bd
" because I do it like every time by accident
cnoreabbrev wq w<bar>bd

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Gundo Mappings
    nnoremap <F5> :GundoToggle<CR>

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

" Quickcompile binding
    nnoremap <F3> :source ~/.vim-quickcompile<CR>

" Set mappings only if dependant libs are available
    if ( external_lib_is_available_ctags == 1 )
        " Search through cTags
        nnoremap <leader>g :CtrlPTag<CR>
        " Toogle Tagbar plugin
        let g:tagbar_autofocus=1
        nnoremap <silent> <Leader>j :TagbarToggle<CR>
    endif
