"===
"=== devicon
"===

if has('mac') || has('macunix')
  let g:WebDevIconsOS = 'Darwint'
else
  let g:WebDevIconsOS = 'linux'
endif

" loading the plugin
let g:webdevicons_enable = 1
" 为 NERDTree,airline,startify 提供支持
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_startify = 1
" 设置标志占位2个字符，保证垂直对齐
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
" 遇到未知文件使用以下图标表示
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = '' "‽
" 启用文件夹/目录字形图标
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

let g:WebDevIconsNerdTreeBeforeGlyphPadding = ' '
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {
    \ 'js'       : '',
    \ 'tsx'      : '',
    \ 'cssn'     : '',
    \ 'css'      : '',
    \ 'scss'     : 'ﳪ',
    \ 'htm'      : '',
    \ 'html'     : '',
    \ 'md'       : '',
    \ 'sql'      : '',
    \ 'db'       : '',
    \ 'gradle'   : '',
    \ 'conf'     : '',
    \ 'ini'      : '',
    \ 'yml'      : '',
    \ 'class'    : '',
    \ 'less'     : '',
    \ 'json'     : '',
    \ 'rb'       : '',
    \ 'php'      : 'ﳄ',
    \ 'py'       : '',
    \ 'pyc'      : '',
    \ 'pyo'      : '',
    \ 'pyd'      : '',
    \ 'coffee'   : '',
    \ 'mustache' : '',
    \ 'hbs'      : '',
    \ 'jpg'      : '',
    \ 'jpeg'     : '',
    \ 'bmp'      : '',
    \ 'png'      : '',
    \ 'gif'      : '',
    \ 'ai'       : '',
    \ 'pdf'      : '',
    \ 'twig'     : '',
    \ 'c#'       : '',
    \ 'cs'       : '',
    \ 'cpp'      : '',
    \ 'c++'      : '',
    \ 'cxx'      : '',
    \ 'cc'       : '',
    \ 'cp'       : '',
    \ 'c'        : '',
    \ 'hs'       : '',
    \ 'lhs'      : '',
    \ 'lua'      : '',
    \ 'java'     : '',
    \ 'sh'       : '',
    \ 'diff'     : '',
    \ 'clj'      : '',
    \ 'scala'    : '',
    \ 'go'       : 'ﳑ',
    \ 'dart'     : '',
    \ 'xul'      : '',
    \ 'npm'      : '',
    \ 'nodejs'   : '',
    \ 'ttf'      : 'ﯔ',
    \ 'eot'      : 'ﯔ',
    \ 'fon'      : 'ﯔ',
    \ 'pfm'      : 'ﯔ',
    \ 'vue'      : '﵂',
    \ 'sln'      : '',
    \ 'suo'      : ''
\ }
