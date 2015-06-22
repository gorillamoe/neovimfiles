" Rebind <Leader> key
  let mapleader = ","

" Allow saving of files as sudo when I forgot to start vim using sudo.
  command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

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

" Toggle Vim Hardmode
  nnoremap <Leader>h :call ToggleHardMode()<cr>

" PHP Crap
  nnoremap <F9> :! phpcs --standard=CakePHP %:p<CR>

" Dont mess with paste stuff
  nnoremap <F2> :set paste!<CR>

" Gundo toggle
  nnoremap <F5> :GundoToggle<CR>

" Quicksave command
  noremap <Leader>w :update<CR>
  vnoremap <Leader>w <C-C>:update<CR>
  inoremap <Leader>w <C-O>:update<CR>

" Clear the search buffer when hitting return
:nnoremap <Leader>bd :bd<CR>

" Indentation
  vnoremap < <gv
  vnoremap > >gv

" NERD Tree Binding
nnoremap <LEADER>t :NERDTreeToggle<CR>

" Switch buffers
nnoremap <SPACE> :b#<CR>

" investigate.vim binding
  nnoremap <leader>docs :call investigate#Investigate()<CR>

" Toggle Tagbar plugin
  let g:tagbar_autofocus=1
  nnoremap <silent> <Leader>j :TagbarToggle<CR>

" Clear search highlighting when pressing Enter in command mode
nnoremap <CR> :nohlsearch<CR>/<BS>

" vim:tabstop=2:expandtab
