"===
"=== vim-indent-guides
"===

" 自动开启
let g:indent_guides_enable_on_vim_startup = 1

let g:indent_guides_start_level=2 " 从第二层开始显示缩进
let g:indent_guides_guide_size=1  " 色块宽度

" terminal vim
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
