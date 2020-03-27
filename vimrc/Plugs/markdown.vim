"===
"=== markdown_preview
"===

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 1
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'firefox'
" let g:mkdp_browserfunc = 'D:/Mozilla\ Firefox/firefox.exe'
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit'                : {},
    \ 'katex'               : {},
    \ 'uml'                 : {},
    \ 'maid'                : {},
    \ 'disable_sync_scroll' : 0,
    \ 'sync_scroll_type'    : 'middle',
    \ 'hide_yaml_meta'      : 1,
    \ 'sequence_diagrams'   : {},
    \ 'flowchart_diagrams'  : {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let vim_markdown_preview_hotkey='<C-m>'
