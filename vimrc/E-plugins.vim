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
let g:ale_sign_column_always = 1
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
\   'c++'    : ['clang'],
\   'c'      : ['clang']
\}

let g:ale_linters = {'python': ['flake8'], 'reStructuredText': ['rstcheck']}
let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8']}

" java 报错不乱码
let g:ale_java_javac_options = '-encoding UTF-8  -J-Duser.language=en'

"================================

"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)

"<Leader>s 触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>

"<Leader>d 查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>

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

if v:version < 704 || has('win32')
	function! s:Glob(path, expr)
		let res = []
		for p in split(a:path, ',')
			let h = split(fnamemodify(a:expr, ':h'), '/')[0]
			if isdirectory(p . '/' . h)
				call extend(res, split(glob(p . '/' . a:expr), "\n"))
			endif
		endfor
		return filter(res, 'filereadable(v:val)')
	endfunction
else
	function! s:Glob(path, expr)
		return split(globpath(a:path, a:expr), "\n")
	endfunction
endif

if exists('loaded_snips') || &cp || version < 700
	finish
endif
let loaded_snips = 1

" Save and reset 'cpo'
let s:save_cpo = &cpo
set cpo&vim

au BufRead,BufNewFile *.snippet,*.snippets setlocal filetype=snippets
au FileType snippets if expand('<afile>:e') =~# 'snippet$'
				\ | setlocal syntax=snippet
			\ | else
				\ | setlocal syntax=snippets
			\ | endif

inoremap <silent> <Plug>snipMateNextOrTrigger  <C-R>=snipMate#TriggerSnippet()<CR>
snoremap <silent> <Plug>snipMateNextOrTrigger  <Esc>a<C-R>=snipMate#TriggerSnippet()<CR>
inoremap <silent> <Plug>snipMateTrigger        <C-R>=snipMate#TriggerSnippet(1)<CR>
inoremap <silent> <Plug>snipMateBack           <C-R>=snipMate#BackwardsSnippet()<CR>
snoremap <silent> <Plug>snipMateBack           <Esc>a<C-R>=snipMate#BackwardsSnippet()<CR>
inoremap <silent> <Plug>snipMateShow           <C-R>=snipMate#ShowAvailableSnips()<CR>
xnoremap <silent> <Plug>snipMateVisual         :<C-U>call <SID>grab_visual()<CR>gv"_c

" 配置变量
if !exists('g:snips_author')
	let g:snips_author = 'Me'
endif
if !exists('g:snipMate')
	let g:snipMate = {}
endif

" SnipMate inserts this string when no snippet expansion can be done
let g:snipMate['no_match_completion_feedkeys_chars'] =
			\ get(g:snipMate, 'no_match_completion_feedkeys_chars', "\t")

" 添加默认作用域别名，而不覆盖用户设置
let g:snipMate.scope_aliases = get(g:snipMate, 'scope_aliases', {})
if exists('g:snipMate_no_default_aliases')
	echom 'The g:snipMate_no_default_aliases option has been renamed.'
				\ 'See :h snipMate-options.'
endif
if (!exists('g:snipMate_no_default_aliases') || !g:snipMate_no_default_aliases)
			\ && (!exists('g:snipMate.no_default_aliases')
				\ || !g:snipMate.no_default_aliases)
	let g:snipMate.scope_aliases.objc =
				\ get(g:snipMate.scope_aliases, 'objc', 'c')
	let g:snipMate.scope_aliases.cpp =
				\ get(g:snipMate.scope_aliases, 'cpp', 'c')
	let g:snipMate.scope_aliases.cu =
				\ get(g:snipMate.scope_aliases, 'cu', 'c')
	let g:snipMate.scope_aliases.xhtml =
				\ get(g:snipMate.scope_aliases, 'xhtml', 'html')
	let g:snipMate.scope_aliases.html =
				\ get(g:snipMate.scope_aliases, 'html', 'javascript')
	let g:snipMate.scope_aliases.php =
				\ get(g:snipMate.scope_aliases, 'php', 'php,html,javascript')
	let g:snipMate.scope_aliases.ur =
				\ get(g:snipMate.scope_aliases, 'ur', 'html,javascript')
	let g:snipMate.scope_aliases.mxml =
				\ get(g:snipMate.scope_aliases, 'mxml', 'actionscript')
	let g:snipMate.scope_aliases.eruby =
				\ get(g:snipMate.scope_aliases, 'eruby', 'eruby-rails,html')
	let g:snipMate.scope_aliases.scss =
				\ get(g:snipMate.scope_aliases, 'scss', 'css')
	let g:snipMate.scope_aliases.less =
				\ get(g:snipMate.scope_aliases, 'less', 'css')
endif

" Modified from Luc Hermitte's function on StackOverflow
" <http://stackoverflow.com/a/1534347>
function! s:grab_visual() abort
	let a_save = @a
	try
		normal! gv"ay
		let b:snipmate_visual = @a
	finally
		let @a = a_save
	endtry
endfunction

" TODO: 允许指定任意 snippet 文件
function! s:load_scopes(bang, ...) abort
	let gb = a:bang ? g: : b:
	let gb.snipMate = get(gb, 'snipMate', {})
	let gb.snipMate.scope_aliases = get(gb.snipMate, 'scope_aliases', {})
	let gb.snipMate.scope_aliases['_'] = join(split(get(gb.snipMate.scope_aliases, '_', ''), ',') + a:000, ',')
endfunction

command! -bang -bar -nargs=+ SnipMateLoadScope
			\ call s:load_scopes(<bang>0, <f-args>)

" Edit snippet files
command! SnipMateOpenSnippetFiles call snipMate#OpenSnippetFiles()

" restore(恢复/修复) 'cpo'
let &cpo = s:save_cpo

"===
"=== coc.vim
"===

call coc#add_extension('coc-json', 'coc-tsserver', 'coc-rls','coc-snippets')

let g:coc_node_path = 'D:/Development/nodejs/node'

let g:indent_guides_enable_on_vim_startup = 1
let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
let g:sneak#label = 1
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

"=======================================

" :verbose imap <tab> 查看当前<tab>映射
" 防止映射冲突
" 定制补全体验
" 使用 <tab> 触发补全
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
              \ pumvisible() ? "\<C-n>" :
              \ <SID>check_back_space() ? "\<TAB>" :
              \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" 使用 <C-SPACE> 强制触发补全
inoremap <silent><expr> <c-space> coc#refresh()

" 使用 <CR> 确认补全
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
" 使用 <CR> 确认补全，并触发 coc.nvim 的 formatOnType 功能:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <silent> <cr> <Plug>(coc-openlink)

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> <Leader>k :call <SID>show_documentation()<CR>
