" VIM custom sytax
highlight clear

if exists("syntax_on")
  syntax reset
endif

set background=dark
let g:colors_name="bitmap"

" Vim UI
hi Normal              ctermfg=15
hi Cursor              ctermfg=7   ctermbg=1
hi CursorLine                      ctermbg=0     cterm=NONE
hi MatchParen          ctermfg=15  ctermbg=8     cterm=NONE
hi Pmenu               ctermfg=15  ctermbg=0
hi PmenuThumb                      ctermbg=7
hi PmenuSBar           ctermbg=8
hi PmenuSel            ctermfg=0   ctermbg=4
hi ColorColumn                     ctermbg=0
hi SpellBad            ctermfg=1   ctermbg=NONE  cterm=underline
hi SpellCap            ctermfg=10  ctermbg=NONE  cterm=underline
hi SpellRare           ctermfg=11  ctermbg=NONE  cterm=underline
hi SpellLocal          ctermfg=13  ctermbg=NONE  cterm=underline
hi NonText             ctermfg=8
hi LineNr              ctermfg=8   ctermbg=0
hi CursorLineNr        ctermfg=7   ctermbg=0     cterm=NONE
hi Visual              ctermfg=0   ctermbg=8
hi IncSearch           ctermfg=0   ctermbg=13    cterm=NONE
hi Search              ctermfg=0   ctermbg=10
hi StatusLine          ctermfg=7   ctermbg=0
hi StatusLineNC        ctermfg=8   ctermbg=0
hi VertSplit           ctermfg=0   ctermbg=0     cterm=NONE
hi TabLine             ctermfg=8   ctermbg=0     cterm=NONE
hi TabLineSel          ctermfg=7   ctermbg=0
hi Folded              ctermfg=6   ctermbg=0
hi Conceal             ctermfg=6   ctermbg=NONE
hi Directory           ctermfg=12
hi Title               ctermfg=3
hi ErrorMsg            ctermfg=15  ctermbg=1
hi DiffAdd             ctermfg=0   ctermbg=2
hi DiffChange          ctermfg=0   ctermbg=3
hi DiffDelete          ctermfg=0   ctermbg=1
hi DiffText            ctermfg=0   ctermbg=11
hi User1               ctermfg=1   ctermbg=0
hi User2               ctermfg=4   ctermbg=0
hi User3               ctermfg=2   ctermbg=0
hi User4               ctermfg=3   ctermbg=0
hi User5               ctermfg=5   ctermbg=0
hi User6               ctermfg=6   ctermbg=0
hi User7               ctermfg=7   ctermbg=0
hi User8               ctermfg=8   ctermbg=0
hi User9               ctermfg=15  ctermbg=5
hi! link CursorColumn  CursorLine
hi! link SignColumn    LineNr
hi! link WildMenu      Visual
hi! link FoldColumn    SignColumn
hi! link WarningMsg    ErrorMsg
hi! link MoreMsg       Title
hi! link Question      MoreMsg
hi! link ModeMsg       MoreMsg
hi! link TabLineFill   StatusLineNC
hi! link SpecialKey    NonText

" Syntax
hi Comment             ctermfg=7
hi Constant            ctermfg=14  cterm=NONE
hi String              ctermfg=3
hi Character           ctermfg=11
hi Number              ctermfg=10
hi Float               ctermfg=10
hi Boolean             ctermfg=6
hi Identifier          ctermfg=2   cterm=NONE
hi Function            ctermfg=2
hi Statement           ctermfg=5
hi Operator            ctermfg=7
hi Keyword             ctermfg=4
hi PreProc             ctermfg=3
hi Include             ctermfg=1
hi Define              ctermfg=13
hi Type                ctermfg=4
hi StorageClass        ctermfg=4
hi Structure           ctermfg=4
hi Typedef             ctermfg=4
hi Special             ctermfg=7
hi Delimiter           ctermfg=3
hi Underlined          ctermfg=4   cterm=underline
hi Ignore              ctermfg=0
hi Error               ctermfg=1   ctermbg=NONE
hi Todo                ctermfg=9   ctermbg=NONE  cterm=NONE
