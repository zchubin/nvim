"===
"=== NERDtree
"===

let s:brown       = "905532"
let s:aqua        = "3AFFDB"
let s:blue        = "689FB6"
let s:pastelblue  = "81a1c1"
let s:lightblue   = "88c0d0"
let s:darkBlue    = "44788E"
let s:purple      = "834F79"
let s:lightPurple = "834F79"
let s:red         = "AE403F"
let s:beige       = "F5C06F"
let s:yellow      = "F09F17"
let s:orange      = "D4843E"
let s:darkOrange  = "F16529"
let s:pink        = "CB6F6F"
let s:salmon      = "EE6E73"
let s:green       = "8FAA54"
let s:lightGreen  = "31B53E"
let s:white       = "FFFFFF"

let g:NERDTreeExtensionHighlightColor={}
let g:NERDTreeExtensionHighlightColor['html']=s:pastelblue
let g:NERDTreeExtensionHighlightColor['css']=s:blue
let g:NERDTreeExtensionHighlightColor['scss']=s:blue
let g:NERDTreeExtensionHighlightColor['js']=s:yellow

let g:NERDTreeExtensionHighlightColor['java']=s:purple
let g:NERDTreeExtensionHighlightColor['php']=s:purple
let g:NERDTreeExtensionHighlightColor['rb']=s:purple

let g:NERDTreeExtensionHighlightColor['json']=s:orange
let g:NERDTreeExtensionHighlightColor['vim']=s:orange

let g:NERDTreeExtensionHighlightColor['c']=s:blue
let g:NERDTreeExtensionHighlightColor['h']=s:blue
let g:NERDTreeExtensionHighlightColor['lock']=s:red
let g:NERDTreeExtensionHighlightColor['md']=s:lightGreen
let g:NERDTreeExtensionHighlightColor['pug']=s:lightGreen
let g:NERDTreeExtensionHighlightColor['vue']=s:green

let g:NERDTreeExtensionHighlightColor['png']=s:lightblue
let g:NERDTreeExtensionHighlightColor['jpg']=s:lightblue
let g:NERDTreeExtensionHighlightColor['svg']=s:orange
let g:NERDTreeExtensionHighlightColor['icon']=s:salmon


let s:rspec_red   = 'FE405F'
let s:git_orange  = 'F54D27'

let g:NERDTreeExactMatchHighlightColor={}
let g:NERDTreeExactMatchHighlightColor['node_modules/']=s:lightblue

let g:NERDTreeExactMatchHighlightColor={}
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange

let g:NERDTreePatternMatchHighlightColor = {}
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red
"=== ale
"===

" 清除颜色
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign

"===
"=== HighlightedyankRegion
"===

highlight HighlightedyankRegion cterm=reverse gui=reverse

"===
"=== Coc
"===
" 错误文本显示为红色
highlight CocErrorHighlight ctermfg=Red  guifg=#D0104C
" 错误标记符使用的高亮。
highlight CocErrorSign ctermfg=Red guifg=#CB1B45
" 警告标记符使用的高亮。
highlight CocWarningSign ctermfg=Yellow guifg=#fab005
" 信息标记符使用的高亮。
highlight CocInfoSign ctermfg=green guifg=#BEC23F
" 提醒标记符使用的高亮。
highlight CocHintSign ctermfg=Blue guifg=#2E5C6E

" 错误标记符使用的高亮。
hi default link CocErrorVirtualText   CocErrorSign
" 错误文本使用的高亮。
hi default link CocErrorHighlight     CocUnderline
" 错误浮窗符使用的高亮。
hi default link CocErrorFloat         CocErrorSign
" 警告标记符使用的高亮。
hi default link CocWarningVirtualText CocWarningSign
" 警告文本使用的高亮。
hi default link CocWarningHighlight   CocUnderline
" 警告浮窗符使用的高亮。
hi default link CocWarningFloat       CocWarningSign
" 信息标记符使用的高亮。
hi default link CocInfoVirtualText    CocInfoSign
" 信息文本使用的高亮。
hi default link CocInfoHighlight      CocUnderline
" 信息浮窗符使用的高亮。
hi default link CocInfoFloat           CocInfoSign
" 提醒标记符使用的高亮。
hi default link CocHintVirtualText    CocHintSign
" 提醒文本使用的高亮。
hi default link CocHintHighlight      CocUnderline
" 提醒浮窗符使用的高亮。
hi default link CocHintFloat          CocHintSign

" 浮动窗口配色
" highlight Pmenu ctermbg=237 ctermfg=white
" highlight PmenuSel ctermbg=220 ctermfg=black
" highlight PmenuSbar ctermbg=233
" highlight PmenuThumb ctermbg=7
