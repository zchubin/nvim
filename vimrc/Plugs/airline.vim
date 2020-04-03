"===
"=== airle
"===

" let g:airline_theme='hybrid'
" let g:airline_theme='violet'
let g:airline_theme='base16'

" smart tab line 更智能的标签线
let g:airline#extensions#tabline#enabled = 1

" 为制表行单独配置分隔符，这是定义'直接'制表符的方式
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline_powerline_fonts = 1  " 支持 powerline 字体

let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = '✗ '
let airline#extensions#coc#warning_symbol = '⚡'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" let g:airline#extensions#ale#enabled = 1
"在vim自带的状态栏中整合ale
" let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
" let g:ale_echo_msg_error_str = '✗ '
" let g:ale_echo_msg_warning_str = '⚡'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ' '
" let g:airline_section_b = airline#section#create_left(['filename'])
" let g:airline_section_c = airline#section#create([''])
" let g:airline_section_gutter = airline#section#create(['modified', '%='])

" let g:airline_section_x = airline#section#create_right([''])
" let g:airline_section_y = airline#section#create_right(['%c'])
" let g:airline_section_z = airline#section#create(['branch'])
" let g:airline_section_z = '%{strftime("%m/%d/%y - %H:%M")}'
" 字符对应Unicode码
" '' #xe00  '⮀' #x2b80
" '' #xe02  '⮂' #x2b82
" '' #xe01  '⮁' #x2b81
" '' #xe03  '⮃' #x2b83
" '' #xe00  '⭠' #x2b60
" '' #xe02  '⭤' #x2b64
" '' #xe01  '⭡' #x2b61
