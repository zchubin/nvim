"===
"=== LeaderF
"===

let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1

let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "Envy Code R VS" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = ";ff"
nnoremap <Leader>ff :LeaderfMru<cr>
" nmap <Leader>F :LeaderfFunction<cr>

let g:Lf_WildIgnore = {
    \ 'dir': ['.svn','.git','.hg', 'log'],
    \ 'file': ['*.log*', '*.so', '*.lib', 'vimfiler*', '*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
    \}

let g:Lf_PreviewResult = {
    \ 'File': 0,
    \ 'Buffer': 0,
    \ 'Mru': 0,
    \ 'Tag': 0,
    \ 'BufTag': 1,
    \ 'Function': 1,
    \ 'Line': 1,
    \ 'Colorscheme': 0
    \}

