# init.vim
This is Neovim configuration on **windows10** for a new recruit.

## Installation

Note: init.vim requires Neovim(0.5.0+) with Python3. See
[requires](##requires)
requires if you aren't sure whethre you have this.

You can use `git clone https://github.com/zchubin/nvim-Z.git`
to get it.

## Requirements
This configuration requires Neovim with if_pyhthon3.
if `echo has("Python3")` returns `1` ,then you're done; othrewis, see
below.

You can enable Python3 interface with pip:

```pip
pip3 install --user pynvim
```

If you want to read the pynvim/python3 interface install
documentation, you should read `:help provider-python` and the Wiki.

### Note: Python3 must be enable before updating remote Plugins

## About The Configuration

### Mapkeys
**<leader> map**

| key               | mapkyes                            |
|-------------------|------------------------------------|
| '`<LEADER>`'      | '`<SPACE>`'                        |
| '`<LEADER><CR>`'  | '`:nolsearch<CR>`'                 |
| '`<LEADER><DEL>`' | '`<ESC>lc5l`'                      |
| '`<leader>fd`'    | '`/\(\<\w\+\)\_s*\1`'              |
| '`<leader>W`'     | '`:call DeleteTrailingWS()<CR>`'   |

**imap**

| key          | mapkeys                                                |
|--------------|--------------------------------------------------------|
| ';f'         | '<ESC>/<++><CR>:nohlsearh<CR>c4l'                      |
| ';q'         | '`<ESC>`'                                              |
| '''          | '''<++><ESC>5ha'                                       |
| '"'          | '""<++><ESC>5ha'                                       |
| '('          | '()<++><ESC>5ha'                                       |
| '['          | '[]<++><ESC>5ha'                                       |
| '{'          | '{}<++><ESC>5ha'                                       |
| '"='         | '"===<CR>===<SPACE><CR>===<CR><ESC>0C<CR><++><ESC>3kA' |

**vmap**

| key | mapkeys |
|-----|---------|
| 'y' | '`"*y`' |

**nmap**

| key   | mapkeys                                            |
|-------|----------------------------------------------------|
| 'tu'  | '`:table`'                                         |
| 'tb'  | '`:-tablenext<CR>`'                                |
| 'tn'  | '`:+tablenext<CR>`'                                |
| 'tmb' | '`-tabmove<CR>`'                                   |
| 'tmn' | '`+tabmove<CR>`'                                   |
| 'tk'  | '`nosplitbelow<CR>:split<CR>:set splitbelow<CR>`'  |
| 'tj'  | '`splitbelow<CR>:split<CR>`'                       |
| 'th'  | '`nosplitright<CR>:vsplit<CR>:set splitright<CR>`' |
| 'tl'  | '`splitright<CR>:vsplit<CR>`'                      |
| 'th'  | '`<C-w>t<C-w>K`'                                   |
| 'tv'  | '`<C-w>t<C-w>H`'                                   |

and
```vim
noremap `<up> :res +5<CR>
noremap `<down> :res -5<CR>
noremap `<left> :vertical resize-5<CR>
noremap `<right> :vertical resize+5<CR>
```

### Plug
- [1] 'rakr/vim-one'
- [2] 'vim-ailine/vim-airline'
- [3] 'vim-aiine/vim-airline-themes'
- [4] 'preservim/nerdtree'
- [5] 'vim-scripts/vim-cursorword'
- [6] 'mattn/emment-vim'
- [7] 'othree/html5.vim'
- [8] 'cakebaker/scss-syntax.vim'
- [10] 'ccampbell/rainbow'
- [1] 'gko/vim-coloresque'
- [1] 'preservim/nerdcommenter'
- [1] 'dense-analysis/ale'
- [1] 'iamcco/markdown-preview.vim'

```vim
call plug#begin('~/AppData/Local/nvim/plugged')

" 主题
Plug 'rakr/vim-one'
" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 侧边栏，文件目录
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" 给关键字添加下划线，方便关注
Plug 'vim-scripts/vim-cursorword'

" 语法 (高亮) 缩进 语言包
" Plug 'sheerun/vim-polyglot'

" Html,css
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'css'] }

" 突出显示括号方阵
Plug 'ccampbell/rainbow'

" css3颜色显示
Plug 'gko/vim-coloresque', { 'for': ['html', 'css', 'less', 'sass'] }

" 快速注释
Plug 'preservim/nerdcommenter'
" 拼写检查
Plug 'dense-analysis/ale'

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() },  'for' :['markdown', 'vim-plug'] }

" Shougo
"  框架
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
"  暗色目录
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" 代码片段化
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
" 补全
Plug 'Shougo/neocomplete.vim'

call plug#end()

"====
"==== Vim-one
"====

" 真色彩支持
if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum

let g:airline_theme='one'

colorscheme one
set background=dark " for the dark version
" set background=light " for the light version

" 支持斜体
let g:one_allow_italics = 1 " I love italic for comments

"===
"=== Vim airline
"===

" 打开一个选项卡时自动显示所有缓冲区
" 显示多窗口tab和buffer
let g:airline#extensions#tabline#enabled = 1

" 为制表行单独配置分隔符，这是定义'直接'制表符的d方式
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" 路径格式化程序，
" 这会影响文件路径在单独的选项卡中的显示方式以及右上角的当前缓冲区指示符，
" 为此，使用以下命令设置格式器字段：
let g:airline#extensions#tabline#formatter = 'default'

let g:airline_powerline_fonts = 1  " 支持 powerline 字体

"===
"=== NERDTree
"===

map tt :NERDTreeToggle<CR>

" 打开vim打开nerdtree
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" 更改默认箭头
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" 如果唯一打开的窗口时NERDTree,如何关闭vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 打开上一级目录
let NERDTreeMapUpdirKeepOpen = "l"
" 新建分屏页并打开文件
let NERDTreeMapActivateNode = "i"
" 新建标签页并打开文件
let NERDTreeMapOpenInTab = "o"
" 关闭路径
let NERDTreeMapCloseDir = "n"
" 合并路径
let NERDTreeMapChangeRoot = "y"

let NERDTreeMapPreview = ""
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""

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
"=== rainbow
"===

" 自动启用插件
let g:rainbow_active = 1

" 配色方案
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
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
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" 允许注释和反转空行
let g:NERDCommentEmptyLines = 1

" 取消注释时启用尾随空白的修剪
let g:NERDTrimTrailingWhitespace = 1

" 启用NERDToggle检查检查所选定的行是否已注释
let g:NERDToggleCheckAllLines = 1

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
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let vim_markdown_preview_hotkey='<C-m>'

"===
"=== markdown-keys
"===

autocmd Filetype markdown inoremap ;1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;5 #####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;6 ######<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;n ---<Enter><Enter>
autocmd Filetype markdown inoremap ;m - [ ] <Enter><++><ESC>kA
autocmd Filetype markdown inoremap ;b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ;s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap ;i ** <++><Esc>F*i
autocmd Filetype markdown inoremap ;d `` <++><Esc>F`i
autocmd Filetype markdown inoremap ;c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ;h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ;p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ;a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ;l --------<Enter>
