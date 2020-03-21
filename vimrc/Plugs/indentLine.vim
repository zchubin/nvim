"===
"=== indentLine
"===

" let g:indentLine_loaded = 1

if &background  ==# 'dark'
   let g:indentLine_color_term = get(g:, 'indentLine_color_term', 239)
   let g:indentLine_color_gui  = get(g:, 'indentLine_color_gui', '#504945')
else
   let g:indentLine_color_gui  = get(g:, 'indentLine_color_gui', '#DDB76C')
endif

" let g:indentLine_char            = '┆'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor   = 'niv'      " default 'inc'
let g:indentLine_conceallevel    = 2
let g:indentLine_setColors       = 0
let g:indentLine_fileTypeExclude = ['help', 'startify', 'vimfiler', 'haskell', 'erlang']

let g:indentLine_fileTypeExclude = get(g:, 'indentLine_fileTypeExclude', [
      \ 'help',
      \ 'man',
      \ 'startify',
      \ 'vimfiler',
      \ 'markdown'
      \ ])
let g:indentLine_fileType = get(g:, 'indentLine_fileType', [
      \ 'sh',
      \ 'zsh',
      \ 'vim',
      \ 'c',
      \ 'cpp',
      \ 'python',
      \ 'json',
      \ 'javascript',
      \ 'javascript.jsx',
      \ 'typescript',
      \ 'java',
      \ 'kotlin',
      \ 'objc',
      \ 'objcpp',
      \ 'vue',
      \ 'groovy',
      \ 'yaml',
      \ ])
