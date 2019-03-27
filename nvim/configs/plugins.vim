let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = '/home/marco/code/go/bin/gocode'

" Vim REST Console

" For debugging
let g:vrc_show_command = 0

" let b:vrc_response_default_content_type = 'application/json'

let g:vrc_curl_opts = {
  \ '-sS': '',
  \ '--connect-timeout': 10,
  \ '-i': '',
  \ '--max-time': 60,
  \ '-k': '',
\}


" Emmet
" Also for React jsx files
let g:user_emmet_settings = {
    \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" Ale
" Make it more pleasing to my eyes
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '∙'
let g:ale_lint_on_enter = 1 " Enforce linting on opening up a file
let g:ale_fix_on_save = 1 " Force ale_fixers on save / :ALEFix
" Also specify linters
" Requires:
" ```
" npm i -g eslint && npm i -g eslint-plugin-react
" npm i -g prettier
" npm i -g tslint
" npm i -g csslint
" wget https://cs.sensiolabs.org/download/php-cs-fixer-v2.phar -O php-cs-fixer && \
" sudo chmod a+x php-cs-fixer && \
" sudo mv php-cs-fixer /usr/local/bin/php-cs-fixer
" ```
let g:ale_linters = {
        \'javascript': ['eslint'],
        \'typescript': ['tslint', 'tsserver'],
        \'typescript.jsx': ['tslint', 'tsserver'],
        \'csslint': ['csslint'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'tslint'],
\   'typescript.jsx': ['prettier', 'tslint'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'php': ['php_cs_fixer'],
\}

" Toggle ALE Fixers on/off
" Big shout out to zArubaru
" See: https://github.com/w0rp/ale/issues/1353#issuecomment-424677810
command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"

" indentLine Plugin Configuration
let g:indentLine_fileTypeExclude = ['json']
noremap <Leader>v :IndentLinesToggle<CR>

" vim-markdown Plugin Configuration
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_fenced_languages = [
                        \'javascript=javascript',
                        \'c++=cpp',
                        \'viml=vim',
                        \'bash=sh',
                        \'ini=dosini'
                        \]

" The Silver Searcher
if executable('ag')
        " Use ag over grep
        set grepprg=ag\ --nogroup\ --nocolor
endif

" vim:tabstop=8:expandtab
