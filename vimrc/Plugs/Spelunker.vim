"===
"=== Spelunker.vim
"===

" 开启拼写检查
let g:enable_spelunker_vim = 1

" 只读/缓存文件
let g:enable_spelunker_vim_on_readonly = 0

" 拼写检查是否长于设置的字符
let g:spelunker_target_min_char_len = 4

" 建议条数
let g:spelunker_max_suggest_words = 15

" 缓冲区突出显示单词最大数
let g:spelunker_max_hi_words_each_buf = 200

" 加速加载
let g:spelunker_check_type = 2

" 仅突出显示拼写错误
let g:spelunker_highlight_type = 2

" 禁用 URI 检查
let g:spelunker_disable_uri_checking = 1
