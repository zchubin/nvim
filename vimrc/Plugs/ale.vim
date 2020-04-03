"===
"=== ale
"===

" 使用 quickfix 代替 loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

"打开文件时不进行检查
let g:ale_lint_on_enter = 0

"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'

" let g:ale_sign_error = '✗'
" let g:ale_sign_warning = '⚡'

"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++'    : ['clang'],
\   'c'      : ['clang']
\}

let g:ale_linters = {'python': ['flake8'], 'reStructuredText': ['rstcheck']}
let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8']}

" java 报错不乱码
let g:ale_java_javac_options = '-encoding UTF-8  -J-Duser.language=en'

"================================

"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap aj <Plug>(ale_previous_wrap)
nmap ak <Plug>(ale_next_wrap)

" 触发/关闭语法检查
nmap ale :ALEToggle<CR>

" 查看错误或警告的详细信息
nmap <Leader>dd :ALEDetail<CR>

