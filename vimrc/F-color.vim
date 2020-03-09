"===
"=== ale
"===

" 清除颜色
highlight clear ALEErrorSign
highlight clear ALEWarningSign

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
