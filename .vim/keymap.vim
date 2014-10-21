" Rebind <Leader> key
  let mapleader = ","

" Allow saving of files as sudo when I forgot to start vim using sudo.
  cmap w!! w !sudo tee > /dev/null %

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

" Colors
  let g:current_colorscheme = 0

  function! ToggleColorscheme()
      if (g:current_colorscheme == 0)
          set background=light
          colorscheme solarized
          let g:current_colorscheme=1
      else
          set background=dark
          colorscheme molokaimproved
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
