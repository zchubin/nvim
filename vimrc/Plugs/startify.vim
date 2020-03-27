"===
"=== startify
"===

" 是否自动加载目录下的Session.vim, 很好用
let g:startify_session_autoload = 1

" 过滤列表，支持正则表达式
let g:startify_skiplist = [
       \ '\.vimgolf',
       \ '^/tmp',
       \ '/project/.*/documentation',
       \ escape(fnamemodify($HOME, ':p'), '\') .'mysecret.txt',
       \ ]

let g:startify_custom_header = [
            \ ' +--------------------------------------------+',
            \ ' |  b:在不同窗口打开          t:在tab中打开   |',
            \ ' |  s:水平切分窗口            v:垂直切分窗口  |',
            \ ' +--------------------------------------------+',
            \ '       o',
            \ '        o   ^__^',
            \ '         o  (oo)\_______',
            \ '            (__)\       )\/\',
            \ '                ||----w |',
            \ '                ||     ||',
            \ ]

let g:startify_bookmarks = [
            \ '~/Desktop/text.txt',
            \ '~/Desktop/README.md',
            \ '~/Desktop/index.html',
            \ '~/Desktop/main.py',
            \ '~/Desktop/hello.java',
            \ ]

let g:startify_custom_footer = [
            \ ' +--------------------------------------------+',
            \ ' |      -zchubin-work-menu-                   |',
            \ ' +--------------------------------------------+',
            \ ]

