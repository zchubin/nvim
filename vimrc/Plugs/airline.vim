"===
"=== airle
"===

" let g:airline_theme='violet'
let g:airline_theme='base16'

" smart tab line 更智能的标签线
let g:airline#extensions#tabline#enabled = 1

" 为制表行单独配置分隔符，这是定义'直接'制表符的方式
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline_powerline_fonts = 1  " 支持 powerline 字体
" 添加特殊字符
set statusline+=%4*\ %F\ %*
hi User4 cterm=bold ctermfg=169 ctermbg=239
