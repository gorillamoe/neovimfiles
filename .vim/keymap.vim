" Rebind <Leader> key
  let mapleader = ","

" Allow saving of files as sudo when I forgot to start vim using sudo.
  cmap w!! w !sudo tee > /dev/null %

" Enable CakePHP Mode
  let g:CakePhpMode = 0
  function! CakePhpModeToggle()
    if g:CakePhpMode == 1
      let g:CakePhpMode = 0
      set expandtab
      let g:syntastic_php_phpcs_args = "--tab-width="
    else
      let g:CakePhpMode = 1
      set noexpandtab
      let g:syntastic_php_phpcs_args = "--standard=CakePHP --tab-width="
    endif
    echo "CakePhpMode: " . g:CakePhpMode
  endfunc

  nnoremap <F3> :call CakePhpModeToggle()<CR>


" Awesome line number magic
  function! NumberToggle()
    if(&relativenumber == 1)
      set number
    else
      set relativenumber
    endif
  endfunc

  nnoremap <Leader>l :call NumberToggle()<cr>
  :au FocusLost * set number
  :au FocusGained * set relativenumber
  autocmd InsertEnter * set number
  autocmd InsertLeave * set relativenumber
  set relativenumber

" Colors
  let g:current_colorscheme = 0

  function! ToggleColorscheme()
      if (g:current_colorscheme == 0)
          set background=light
          colorscheme solarized
          let g:current_colorscheme=1
      else
          set background=dark
          colorscheme wombat256mod
          let g:current_colorscheme=0
          highlight ColorColumn ctermbg=235
      endif
  endfunction

  nnoremap <F8> :call ToggleColorscheme()<CR>

" PHP Crap
  nnoremap <F9> :! phpcs --standard=CakePHP %:p<CR>

" Dont mess with paste stuff
  nnoremap <F2> :set paste!<CR>

" Quicksave command
  noremap <Leader>w :update<CR>
  vnoremap <Leader>w <C-C>:update<CR>
  inoremap <Leader>w <C-O>:update<CR>

" Toggle Search Highlighting
map  <F12> :set hls!<CR>
imap <F12> <ESC>:set hls!<CR>a
vmap <F12> <ESC>:set hls!<CR>gv

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

" Toogle Tagbar plugin
  let g:tagbar_autofocus=1
  nnoremap <silent> <Leader>j :TagbarToggle<CR>
" vim:tabstop=2:expandtab
