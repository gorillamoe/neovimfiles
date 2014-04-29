" Rebind <Leader> key
  let mapleader = ","

" Allow saving of files as sudo when I forgot to start vim using sudo.
  cmap w!! w !sudo tee > /dev/null %

" UltiSnips
  set runtimepath+=~/.vim/bundle/UltiSnips
  set runtimepath+=~/.vim/snippets
  let g:UltiSnipsSnippetsDir = "~/.vim/snippets/"
  let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'snippets']
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" found here: http://stackoverflow.com/a/2170800/70778
" Navigate OmniPopup with j and k
  function! OmniPopup(action)
      if pumvisible()
          if a:action == 'j'
              return "\<C-N>"
          elseif a:action == 'k'
              return "\<C-P>"
          endif
      endif
      return a:action
  endfunction
  inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
  inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

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
          highlight ColorColumn ctermbg=233
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
      " Toogle Tagbar plugin
      let g:tagbar_autofocus=1
      nnoremap <silent> <Leader>j :TagbarToggle<CR>
  endif
" vim:tabstop=2:expandtab
