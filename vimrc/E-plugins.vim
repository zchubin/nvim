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
            \]

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
            \]

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
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = '?'
" 启用文件夹/目录字形图标
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

"====
"==== Vim-themes airline vim-highlightedyank
"====

" colors ron
" hi PmenuSel ctermbg=lightblue

set background=dark " for the dark version
" set background=light " for the light version

colorscheme one
" colorscheme gruvbox

" HighlightedyankRegion
highlight HighlightedyankRegion cterm=reverse gui=reverse
" Coc:错误+错误标志+警告标志+信息标记符+提醒标记
" highlight CocErrorHighlight ctermfg=Red  guifg=#ff0000
" highlight CocErrorSign  ctermfg=Red guifg=#ff0000
" highlight CocWarningSign  ctermfg=Brown guifg=#ff922b
" highlight CocInfoSign  ctermfg=Yellow guifg=#fab005
" highlight CocHintSign  ctermfg=Blue guifg=#15aabf
"
" 支持斜体
let g:one_allow_italics = 1

" call one#highlight('vimLineComment', '535c68', ' ', 'italic')

let g:airline_theme='one'
" let g:airline_theme='gruvbox'
"---------------------------------------------------------------------
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

" 在什么模式中启用脚本
"let g:user_emmet_mode='n'    "only enable normal mode functions.
"let g:user_emmet_mode='inv'  "enable all functions, which is equal to
"let g:user_emmet_mode='a'    "enable all function in all mode.

" 仅在html/css中启用脚本
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" 定义触发键
let g:user_emmet_leader_key=';'

"===
"=== ale
"===

" 清除颜色
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" 使用 quickfix 代替 loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

"打开文件时不进行检查
let g:ale_lint_on_enter = 0

"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'

" 保持标志槽打开
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'

" 在vim-bar显示警告或错误
let g:airline#extensions#ale#enabled = 1

"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']

"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = '✗'
let g:ale_echo_msg_warning_str = '⚡'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)

"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>

"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>

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
"=== vim-which-key
"===

call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

let g:which_key_map =  {}
let g:which_key_map = {
	\ '键' : '用法',
    \ 'w'  : '替换行尾空格',
    \ 'r'  : '调用运行命令',
    \ 'c'  : {
      \ '键' : '注释插件',
      \ 'a'  : '在可选注释之间切换',
      \ 'A'  : '在当前行尾添加注释',
      \ '$'  : '在当前光标后添加注释',
      \ 'c'  : '注释当前行',
      \ 's'  : '使用"sexy"进行注释',
      \ 'u'  : '取消注释',
      \ 'm'  : '进行块注释',
      \ 'y'  : '注释并复制内容',
      \ },
    \ 'f' : {
      \ '键' : '查找',
      \ 'd'  : '编辑$MYVIMRC文件',
      \ 'w'  : '查找两个相邻重复单词',
      \ },
    \ }

" 自定义提示键位
nnoremap <silent> ` :<c-u>WhichKey '`'<CR>
nnoremap <silent> t :<c-u>WhichKey 't'<CR>
nnoremap <silent> s :<c-u>WhichKey 's'<CR>

"===
"=== NERDTree
"===

map tt :NERDTreeToggle<CR>
let g:NERDTreeWinSize=25
" 打开vim打开nerdtree
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" 更改默认箭头
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" 如果唯一打开的窗口时NERDTree,如何关闭vim
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
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

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
"=== gitgutter
"===

" nmap ]h <Plug>(GitGutterNextHunk)
" nmap [h <Plug>(GitGutterPrevHunk)
"
" nmap ghs <Plug>(GitGutterStageHunk)
" nmap ghu <Plug>(GitGutterUndoHunk)

"===
"=== coc.vim
"===

" " coc-json
" call coc#add_extension('coc-json', 'coc-tsserver', 'coc-rls','coc-snippets')
" " nodejs
" let g:coc_node_path = 'D:/Development/nodejs/node'
"
" " 修正COC Bug
" silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
" let g:coc_global_extensions = [
"             \ 'coc-python'  , 'coc-vimlsp'      , 'coc-html'       ,
"             \ 'coc-json'    , 'coc-css'         , 'coc-tsserver'   ,
"             \ 'coc-yank'    , 'coc-lists'       , 'coc-gitignore'  ,
"             \ 'coc-vimlsp'  , 'coc-tailwindcss' , 'coc-stylelint'  ,
"             \ 'coc-tslint'  , 'coc-lists'       , 'coc-git'        ,
"             \ 'coc-pyright' , 'coc-sourcekit'   , 'coc-translator' ,
"             \ 'coc-explorer'
"             \ ]
"
" " :verbose imap <tab> 查看当前<tab>映射
" " 防止映射冲突
" function! s:check_back_space() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" tnoremap <silent><expr> <TAB>
"     \ pumvisible() ? "\<C-n>" :
"     \ <SID>check_back_space() ? "\<TAB>" :
"     \ coc#refresh()
"
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" " 使用 <C-SPACE> 强制触发补全
" inoremap <silent><expr> <c-space> coc#refresh()
"
" if has('patch8.1.1068')
"     inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"     imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" end
"
" " nnoremap <silent> if <Plug>(coc-diagnostic-info)
" " nnoremap <silent> fb <Plug>(coc-diagnostic-prev)
" " nnoremap <silent> fn <Plug>(coc-diagnostic-next)
" "
" " nnoremap <silent> fdi <Plug>(coc-definition)     " 定义位置
" " nnoremap <silent> fdl <Plug>(coc-declaration)    " 声明位置
" " nnoremap <silent> fil <Plug>(coc-implementation) " 实现位置
" " nnoremap <silent> frf <Plug>(coc-references)     " 引用位置
"
" nnoremap <silent> <cr> <Plug>(coc-openlink)
"
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                         \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
" nnoremap <silent> <Leader>k :call <SID>show_documentation()<CR>
"
" " autocmd CursorHold * silent call CocActionAsync('highlight')
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
" let g:coc_filetype_map = {
"     \ 'html.swig'      : 'html',
"     \ 'wxss'           : 'css',
"     \ 'javascript.jsx' : 'javascriptreact',
"     \ 'typescript.tsx' : 'typescriptreact'
"     \ }
