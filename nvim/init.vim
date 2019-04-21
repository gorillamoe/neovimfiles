runtime plugged.vim
runtime configs/global.vim
runtime configs/keymap.vim
runtime configs/plugins.vim
runtime configs/spell.vim
runtime configs/theme.vim

" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
" vim:tabstop=8:expandtab
