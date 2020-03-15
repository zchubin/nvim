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

let g:startify_bookmarks = [
            \ '~/Desktop/1.txt',
            \ '~/Desktop/2.md',
            \ '~/Desktop/3.html',
            \ '~/Desktop/4.py',
            \ '~/Desktop/5.java',
            \ ]

let g:startify_custom_header = [
            \ '+--------------------------------------------+',
            \ '|  b:在不同窗口打开          t:在tab中打开   |',
            \ '|  s:水平切分窗口            v:垂直切分窗口  |',
            \ '+--------------------------------------------+',
            \ '       o',
            \ '        o   ^__^',
            \ '         o  (oo)\_______',
            \ '            (__)\       )\/\',
            \ '                ||----w |',
            \ '                ||     ||',
            \ ]

let g:startify_custom_footer = [
            \ '+--------------------------------------------+',
            \ '|      -zchubin-work-menu-                   |',
            \ '+--------------------------------------------+',
            \ ]

"===
"=== devicon
"===
let g:WebDevIconsOS = 'Darwin'
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
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = '‽'
" 启用文件夹/目录字形图标
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

"====
"==== airline vim-highlightedyank
"====

" let g:airline_theme='violet'
let g:airline_theme='base16'

" smart tab line 更智能的标签线
let g:airline#extensions#tabline#enabled = 1

" 为制表行单独配置分隔符，这是定义'直接'制表符的方式
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" 路径格式化程序，
" 这会影响文件路径在单独的选项卡中的显示方式以及右上角的当前缓冲区指示符，
" 为此，使用以下命令设置格式器字段：
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline_powerline_fonts = 1  " 支持 powerline 字体
" 添加特殊字符
set statusline+=%4*\ %F\ %*
hi User4 cterm=bold ctermfg=169 ctermbg=239
"---------------------------------------------------------------------
" 高亮持续时间
let g:highlightedyank_highlight_duration = 100

"===
"=== NERD Commenter
"===

"""""""""""""""""""""""""""""""""""""""
" <LEADER>ca  在可选的注释方式之间切换  "
" <LEADER>cc  注释当前行               "
" <LEADER>cs  添加 "性感"注释          "
" <LEADER>cA  在当前行尾添加注释        "
" <LEADER>cu  取消注释                 "
" <LEADER>cm  添加块注释               "
"""""""""""""""""""""""""""""""""""""""

" 默认注释定界符后添加空格
let g:NERDSpaceDelims = 1

" 对紧凑的多行注释使用紧凑语法
let g:NERDCompactSexyComs = 1

" 将行注释的定界符向左对齐，而不是跟随代码缩进
let g:NERDDefaultAlign = 'left'

" 设定编程语言使用其默认的定界符
let g:NERDAltDelims_java = 1

" 添加自定义格式或覆盖默认值
let g:NERDCustomDelimiters = {
    \ 'c': { 'left': '/**','right': '*/' },
    \ 'json': { 'left': '//'}
    \ }

" 允许注释和反转空行
let g:NERDCommentEmptyLines = 1

" 取消注释时启用尾随空白的修剪
let g:NERDTrimTrailingWhitespace = 1

" 启用NERDToggle检查检查所选定的行是否已注释
let g:NERDToggleCheckAllLines = 1

"===
"=== rainbow
"===

" 自动启用插件
let g:rainbow_active = 1

" 配色方案
let g:rainbow_conf = {
\   'guifgs': ['royalblue', 'darkorange', 'seagreen', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue', 'darkorange', 'seagreen', 'firebrick', 'darkorchid'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

"===
"=== Tabular
"===

" :Tab /=        等号对齐
" :Tab /:        冒号对齐
" :Tab /:\zs     冒号后的文字对齐
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

"===
"=== emmet
"===

" 仅在html/css中启用脚本
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript EmmetInstall
" 定义触发键
let g:user_emmet_leader_key=';'

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

" 保持标志槽打开
" let g:ale_sign_column_always = 1
" let g:ale_sign_error = '✗'
" let g:ale_sign_warning = '⚡'

" 在vim-bar显示警告或错误
let g:airline#extensions#ale#enabled = 1

"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']

"显示Linter名称,出错或警告等相关信息
" let g:ale_echo_msg_error_str = '✗'
" let g:ale_echo_msg_warning_str = '⚡'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}

let g:ale_linters = {'python': ['flake8'], 'reStructuredText': ['rstcheck']}
let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8']}

" java 报错不乱码
let g:ale_java_javac_options = '-encoding UTF-8  -J-Duser.language=en'
"===
"=== vim-syntastic
"===

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"===
"=== NERDTree
"===

map tt :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
let NERDTreeWinSize=25

" 打开vim打开nerdtree
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" 更改默认箭头
let g:NERDTreeDirArrowExpandable  = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" 如果唯一打开的窗口是NERDTree,如何关闭vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : "☒",
    \ "Unknown"   : "?"
    \ }
" 隐藏标识符括号
augroup nerdtreeconcealbrackets
      autocmd!
      autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=ALL
      autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=ALL
      autocmd FileType nerdtree setlocal conceallevel=3
      autocmd FileType nerdtree setlocal concealcursor=nvic
augroup END

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1

let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeSyntaxEnabledExtensions = [
    \ 'html', 'css', 'scss', 'js',
    \ 'java', 'php', 'rb',
    \ 'json', 'vim',
    \ 'c', 'h', 'lock', 'md', 'pug', 'vue',
    \ 'png', 'jpg', 'svg', 'icon'
    \ ]
let g:NERDTreeHighlightCursorline = 0
"===
"=== markdown_preview
"===

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 1
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
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

function! g:Open_firefox_in_new_window(url)
    silent exe 'silent !open -na "Firefox" --args --new-window ' . a:url
endfunction

let g:mkdp_browserfunc='g:Open_firefox_in_new_window'
"===
"=== python
"===

let g:SimpylFold_docstring_preview = 1

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

let g:Lf_ShortcutF = "<leader>ff"

"===
"=== snipMate
"===

let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'

let g:tex_flavor = "latex"
" inoremap <c-n> <nop>
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories = [$HOME.'~/AppData/Local/nvim/Ultisnips/', 'UltiSnips']
" silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>

"===
"=== coc.vim
"===

" coc-json
call coc#add_extension('coc-json', 'coc-tsserver', 'coc-rls','coc-snippets')
" nodejs
let g:coc_node_path = 'D:/Development/nodejs/node'
" let g:coc_node_path = '/usr/bin/node'

" 修正COC Bug
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = [
            \ 'coc-python'  , 'coc-vimlsp'      , 'coc-html'       ,
            \ 'coc-json'    , 'coc-css'         , 'coc-tsserver'   ,
            \ 'coc-yank'    , 'coc-lists'       , 'coc-gitignore'  ,
            \ 'coc-vimlsp'  , 'coc-tailwindcss' , 'coc-stylelint'  ,
            \ 'coc-tslint'  , 'coc-lists'       , 'coc-git'        ,
            \ 'coc-pyright' , 'coc-sourcekit'   , 'coc-translator' ,
            \ 'coc-explorer'
            \ ]

" autocmd CursorHold * silent call CocActionAsync('highlight')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:coc_filetype_map = {
    \ 'html.swig'      : 'html',
    \ 'wxss'           : 'css',
    \ 'javascript.jsx' : 'javascriptreact',
    \ 'typescript.tsx' : 'typescriptreact'
    \ }
