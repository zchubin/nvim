"===
"=== startify
"===

" \ '+-------------------------------------+' ,
" \ '|           Hi~ o(*￣▽￣*)ブ          |' ,
" \ '|  b:不同窗口打开     t:在tab 中打开  |' ,
" \ '|  s:水平切分窗口     v:垂直切分窗口  |' ,
" \ '+-------------------------------------+' ,

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
            \ '         _           _     _'       ,
            \ '        | |         | |   (_)'      ,
            \ ' _______| |__  _   _| |__  _ _ __'  ,
            \ '|_  / __| |_ \| | | | |_ \| |  _ \' ,
            \ ' / / (__| | | | |_| | |_) | | | | |',
            \ '/___\___|_| |_|\__,_|_.__/|_|_| |_|',
            \ ]

let g:startify_lists = [
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'dir',       'header': ['   Dirs '. getcwd()] },
            \ { 'type': 'files',     'header': ['   Files']            },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]

let g:startify_files_number = 5
let g:startify_change_to_vcs_root = 1
let g:startify_session_sort = 1
let g:startify_relative_path = 1

let g:startify_bookmarks = [
            \ '~/Desktop/text.txt',
            \ '~/Desktop/README.md',
            \ '~/Desktop/index.html',
            \ '~/Desktop/main.py',
            \ '~/Desktop/hello.java',
            \ ]

let g:startify_custom_footer = [
            \ '+--------------------------------+',
            \ '| - zchubin -work-menuヾ(≧▽≦*)o- |',
            \ '+--------------------------------+',
            \ ]

function! Zhong_startify_center(lines) abort
    let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction

let g:startify_custom_header = Zhong_startify_center(g:startify_custom_header)
let g:startify_custom_footer = Zhong_startify_center(g:startify_custom_footer)

autocmd! FileType startify
autocmd  FileType startify set laststatus=0 showtabline=0
    \| autocmd BufLeave <buffer> set laststatus=2 showtabline=2
