" Vim color scheme
"
" Name:       oldschool.vim
" Maintainer: Marco Kellershoff <marco.kellershoff@gmail.com>
" License:    MIT

set background=dark

hi clear
if exists('syntax_on')
        syntax reset
endif

let g:colors_name = 'oldschool'

let s:color_white  = ['#ffffff', 15]
let s:color_black  = ['#2F343F', 0]
let s:color_light_black  = ['#181818', 8]
let s:color_light_gray  = ['#aaaaaa', 7]
let s:color_gray  = ['#737373', 7]
let s:color_blue  = ['#0ABDC6', 4]
let s:color_yellow = ['#F7F26D', 2]
let s:color_red    = ['#AF1B4D', 1]
let s:color_green  = ['#19cf85', 3]

let s:default_fg = s:color_light_gray
let s:default_bg = s:color_black

let s:italic    = 'italic'
let s:bold      = 'bold'
let s:underline = 'underline'
let s:none      = 'NONE'

let s:default_lst = []
let s:default_str = ''

if !exists("g:oldschool_italic_comments")
        let g:oldschool_italic_comments = 0
endif
let s:comment_attr = g:oldschool_italic_comments ? s:italic : s:none

function! s:hi(...)
        let group = a:1
        let fg    = get(a:, 2, s:default_fg)
        let bg    = get(a:, 3, s:default_bg)
        let attr  = get(a:, 4, s:default_str)

        let cmd = ['hi', group]

        if fg != s:default_lst
                call add(cmd, 'guifg='.fg[0])
                call add(cmd, 'ctermfg='.fg[1])
        endif

        if bg != s:default_lst
                call add(cmd, 'guibg='.bg[0])
                call add(cmd, 'ctermbg='.bg[1])
        endif

        if attr != s:default_str
                call add(cmd, 'gui='.attr)
                call add(cmd, 'cterm='.attr)
        endif

        exec join(cmd, ' ')
endfunction


"
" --- Vim interface ------------------------------------------------------------
"

call s:hi('Normal')
call s:hi('Cursor', s:color_black, s:color_light_gray)
call s:hi('CursorLine', s:default_lst, s:color_light_black, s:none)
call s:hi('CursorLineNr', s:color_white, s:default_bg, s:bold)
call s:hi('ColorColumn', s:default_fg, s:color_light_black)
call s:hi('Search', s:color_white, s:color_blue)
call s:hi('Visual', s:color_white, s:color_blue)
call s:hi('ErrorMsg', s:color_white, s:color_red)

" Tildes at the bottom of a buffer, etc.
call s:hi('NonText', s:color_gray)

" Folding.
call s:hi('FoldColumn', s:color_light_black)
call s:hi('Folded')

" Line numbers gutter.
call s:hi('LineNr', s:color_gray)

" Small arrow used for tabs.
call s:hi('SpecialKey', s:color_blue, s:default_bg, s:bold)

" File browsers.
call s:hi('Directory', s:color_white, s:default_bg, s:bold)

" Help.
call s:hi('helpSpecial')
call s:hi('helpHyperTextJump', s:color_blue, s:default_bg, s:underline)
call s:hi('helpNote')

" Popup menu.
call s:hi('Pmenu', s:color_white, s:color_light_black)
call s:hi('PmenuSel', s:color_blue, s:color_white)

" Notes.
call s:hi('Todo', s:color_black, s:color_red, s:bold)

" Signs.
call s:hi('SignColumn')

"
" --- Programming languages ----------------------------------------------------
"

call s:hi('Statement', s:color_green, s:default_bg, s:bold)
call s:hi('PreProc', s:color_white, s:default_bg, s:bold)
call s:hi('String', s:color_blue)
call s:hi('Comment', s:color_gray, s:default_bg, s:comment_attr)
call s:hi('Constant')
call s:hi('Type', s:color_white, s:default_bg, s:bold)
call s:hi('Function', s:color_yellow)
call s:hi('Identifier')
call s:hi('Special')
call s:hi('MatchParen', s:color_black, s:color_light_gray)


"
" --- VimL ---------------------------------------------------------------------
"

call s:hi('vimOption')
call s:hi('vimGroup')
call s:hi('vimHiClear')
call s:hi('vimHiGroup')
call s:hi('vimHiAttrib')
call s:hi('vimHiGui')
call s:hi('vimHiGuiFgBg')
call s:hi('vimHiCTerm')
call s:hi('vimHiCTermFgBg')
call s:hi('vimSynType')
hi link vimCommentTitle Comment


"
" --- Ruby ---------------------------------------------------------------------
"

call s:hi('rubyConstant')
call s:hi('rubySharpBang', s:color_gray)
call s:hi('rubyStringDelimiter', s:color_blue)
call s:hi('rubyStringEscape', s:color_blue)
call s:hi('rubyRegexpEscape', s:color_blue)
call s:hi('rubyRegexpAnchor', s:color_blue)
call s:hi('rubyRegexpSpecial', s:color_blue)


"
" --- Elixir -------------------------------------------------------------------
"

call s:hi('elixirAlias', s:default_fg, s:default_bg, s:none)
call s:hi('elixirDelimiter', s:color_blue)
call s:hi('elixirSelf', s:default_fg, s:default_bg, s:none)

" For ||, ->, etc.
call s:hi('elixirOperator')

" Module attributes like @doc or @type.
hi link elixirVariable Statement

" While rendered as comments in other languages, docstrings are strings,
" experimental.
hi link elixirDocString String
hi link elixirDocTest String
hi link elixirStringDelimiter String


"
" --- Perl ---------------------------------------------------------------------
"

call s:hi('perlSharpBang', s:color_gray)
call s:hi('perlStringStartEnd', s:color_blue)
call s:hi('perlStringEscape', s:color_blue)
call s:hi('perlMatchStartEnd', s:color_blue)


"
" --- Python -------------------------------------------------------------------
"

call s:hi('pythonEscape', s:color_blue)


"
" --- JavaScript ---------------------------------------------------------------
"

call s:hi('javaScriptFunction', s:color_white, s:default_bg, s:bold)


"
" --- Diffs --------------------------------------------------------------------
"

call s:hi('diffFile', s:color_gray)
call s:hi('diffNewFile', s:color_gray)
call s:hi('diffIndexLine', s:color_gray)
call s:hi('diffLine', s:color_gray)
call s:hi('diffSubname', s:color_gray)
call s:hi('diffAdded', s:color_white, s:color_green)
call s:hi('diffRemoved', s:color_white, s:color_red)


"
" --- Markdown -----------------------------------------------------------------
"

call s:hi('Title', s:color_white, s:default_bg, s:bold)
call s:hi('markdownHeadingDelimiter', s:color_white, s:default_bg, s:bold)
call s:hi('markdownHeadingRule', s:color_white, s:default_bg, s:bold)
call s:hi('markdownLinkText', s:color_blue, s:default_bg, s:underline)


"
" --- vim-fugitive -------------------------------------------------------------
"

call s:hi('gitcommitComment', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitOnBranch', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitBranch', s:color_blue, s:default_bg, s:none)
call s:hi('gitcommitHeader', s:color_white, s:default_bg, s:bold)
call s:hi('gitcommitSelected', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitDiscarded', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitSelectedType', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitDiscardedType', s:default_fg, s:default_bg, s:none)


"
" --- NeoMake ------------------------------------------------------------------
"

call s:hi('NeomakeMessageSign')
call s:hi('NeomakeWarningSign', s:color_blue)
call s:hi('NeomakeErrorSign', s:color_yellow)
call s:hi('NeomakeInfoSign')
call s:hi('NeomakeError', s:color_yellow)
call s:hi('NeomakeInfo', s:default_fg, s:default_bg, s:bold)
call s:hi('NeomakeMessage')
call s:hi('NeomakeWarning', s:color_yellow)
