"===
"=== airline
"===

" 为制表行单独配置分隔符，这是定义'直接'制表符的方式
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

if !exists('g:started_by_firenvim')
    let g:airline_powerline_fonts = 1 " 支持 powerline 字体
    let g:airline_theme='base16'      " 'hybrid' 'violet'
    " let g:airline#extensions#tabline#tabnr_formatter = 'tabnr'
    let g:airline#extensions#tabline#formatter = 'unique_tail'
    " let g:airline#extensions#tabline#formatter = 'jsformatter'
    let g:airline_highlighting_cache = 1

    " smart tab line 更智能的标签线
    " let g:airline#extensions#tabline#enabled = 1
    " let g:airline#extensions#ale#enabled = 1
    " let g:airline#extensions#coc#enabled = 1

    let g:airline_extensions = ['coc', 'tabline']
    let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
    let g:airline#extensions#tabline#tabs_label = ' '
    let g:airline#extensions#tabline#buffers_label = '﬘'
    let g:airline#extensions#tabline#show_close_button = 0
    let g:airline#extensions#tabline#exclude_preview = 1
    let airline#extensions#coc#error_symbol = '✗ '
    let airline#extensions#coc#warning_symbol = '⚡'
    let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
    let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
    let g:airline_section_c = airline#section#create(['%f  ' , '%{get(b:,''coc_current_function'','''')}'])
    let g:airline_section_b = airline#section#create(['%{get(b:,''coc_git_status'','''')}','%{get(g:,''coc_git_status'','''')}'])
    " let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])
    function! StatusDiagnostic() abort
        let info = get(b:, 'coc_diagnostic_info', {})
        if empty(info) | return '' | endif
        let msgs = []
        if get(info, 'error', 0)
            call add(msgs, ' ' . info['error'])
        endif
        if get(info, 'warning', 0)
            call add(msgs, ' ' . info['warning'])
        endif
        if get(info, 'information', 0)
            call add(msgs, ' ' . info['information'])
        endif
        if get(info, 'hint', 0)
            call add(msgs, ' ' . info['hint'])
        endif
        " echo get(g:, 'coc_status', '')
        return join(msgs, ' ')
    endfunction
  let g:airline_section_warning = airline#section#create_right(['%{StatusDiagnostic()}'])
  if !exists('g:airline_symbols')
        let g:airline_symbols = {}
  endif
    " 字符对应Unicode码
    " '' #xe00  '⮀' #x2b80
    " '' #xe02  '⮂' #x2b82
    " '' #xe01  '⮁' #x2b81
    " '' #xe03  '⮃' #x2b83
    " '' #xe00  '⭠' #x2b60
    " '' #xe02  '⭤' #x2b64
    " '' #xe01  '⭡' #x2b61
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
endif
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

