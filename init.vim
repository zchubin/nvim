"=====================================
"=== Auto load for first time uses ===
"=====================================
if empty(glob('~/AppData/Local/nvim/autoload/plug.vim'))
silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
"==============
"=== Ignore ===
"==============
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class
" stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android
"====================
"=== Bash Setting ===
"====================
" 禁用 vi
set nocompatible
" 设置 <Leader>
let mapleader=" "
" 启用正则表达式
set magic
" 设置行号
set nu
" set relativenumber
" 高亮显示当前行
set cursorline
" 光标
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" 延迟绘制（提升性能）
set lazyredraw
" 显示标尺
set ruler
" 状态栏
set showmode
set showcmd
set wildmenu
set wildmode=longest:list,full
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2
set viminfo='10,\"100,:20,%,n~/.viminfo
" vim显示信息
language messages zh_CN.utf-8
let &termencoding=&encoding
" 移动光标上下保持8行行距
set scrolloff=8
" 移动光标左右保留15个字符
set sidescrolloff=15
" 鼠标
if has("mouse") | set mouse=a | endif
set mousemodel=popup
" 启用 <BS>
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set smarttab

set undofile
set history=1000
set nobackup
set noswapfile

" 错误格式
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m
" 文件格式检查
filetype on
filetype indent on
filetype plugin on
if has('autocmd')
	filetype plugin indent on
endif
" 仅对 C/C++/Python/Vim 遵循旧式80列限制
autocmd FileType c,cpp,python,vim set textwidth=80
" 代码编码方式
if has('multi_byte')
	set encoding=utf-8
	set fileencoding=utf-8
   	 set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,big5,euc-jp,euc-kr,latin1
endif
" 单词 = 单词 + 连字符
set iskeyword+=_,$,@,%,#,-
augroup InitFileTypesGroup
	" 清除同组的历史 autocommand
	au!
	" C/C++ 文件使用 // 作为注释
	au FileType c,cpp setlocal commentstring=//\ %s
	" markdown 允许自动换行
	au FileType markdown setlocal wrap
	" lisp 进行微调
	au FileType lisp setlocal ts=8 sts=2 sw=2 et
	" scala 微调
	au FileType scala setlocal sts=4 sw=4 noet
	" haskell 进行微调
	au FileType haskell setlocal et
	" quickfix 隐藏行号
	au FileType qf setlocal nonumber
	" 强制对某些扩展名的 filetype 进行纠正
	au BufNewFile,BufRead *.as setlocal filetype=actionscript
	au BufNewFile,BufRead *.pro setlocal filetype=prolog
	au BufNewFile,BufRead *.es setlocal filetype=erlang
	au BufNewFile,BufRead *.asc setlocal filetype=asciidoc
	au BufNewFile,BufRead *.vl setlocal filetype=verilog
augroup END
" 启用代码高亮
if has('syntax')
	syntax enable
	syntax on
endif
" 启动自动换行
" set wrap
" TXT/Markdown/XML 等比较需要换行
autocmd FileType text,markdown,html,xml set wrap
" 换行时，以单词为界
set linebreak
" 换行后保持缩进
set breakindent
" 换行符
if has("win32")
    set fileformats=dos,unix,mac
else
    set fileformats=unix,mac,dos
endif
" 检查文件标记并跳转
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" 继承前一行缩进方式
set formatoptions=tcrqn
" 自动缩进
set autoindent
" 设置缩进宽度
"tw = tapwidth
set tw=0
" 设置缩进的宽度
"sw = shifrwidth
set sw=4
" 如果后面设置了 expandtab 那么展开 tab 为多少字符
"ts = softtapstop
set ts=4
set expandtab
"使用 C/C++ 缩进
set cindent
augroup PythonTab
	au!
    " 如果你不需要 python 里用 <Tab>
    " 那么注释下面这行字
    " 否则 vim 会在打开 .py 文件时自动设置成空格缩进
	au FileType python setlocal shiftwidth=4 tabstop=4 noexpandtab
augroup END
" 文件被其它编辑器修改后自动载入
set autoread
set autochdir
" 错误不报警 不显示
set noerrorbells
set visualbell
" 高亮显示搜索结果
set hlsearch
" 查找输入时动态增量显示查找结果
set incsearch
" 搜索时忽略大小写
set ignorecase
" 智能判断大小写
set smartcase
" 显示不可见字符
set list
" 用▸示缩进,▫显示空格,>显示扩充,<显示回车
set listchars=tab:▸\ ,trail:▫,extends:>,precedes:<
" 高亮行尾空格
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches() " for performance
" 函数通过替换命令删除行尾空格
func! DeleteTrailingWS()
    exec "normal mz"
    %s/\s\+$//ge
    exec "normal `z"
endfunc
" 保存时自动删除行尾空格
autocmd BufWrite * :call DeleteTrailingWS()
map <leader>W :call DeleteTrailingWS()<CR>
" (*),[*],{*} 可折叠
set wrapmargin=2
if has('folding')
	" 允许代码折叠
	set foldenable
	" 代码折叠默认使用缩进
    	" fdm = foldmethod
	set fdm=indent
	" 默认打开所有缩进
	set foldlevel=99
endif
" 显示最后一行
set display=lastline
" 合并两行中文时不加入空格
"fo = formatoptions
set fo+=mB
" 让 vim 不全菜单行为与 ide 一致
set completeopt=longest,menu
" 分屏时中间显示分隔线便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 文件压缩时不检测文件内容
:let g:ft_ignnore_pat = '\.\(z\|'
" 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
" 或者 Vim 当前目录包含 .tags 文件
set tags=./.tags;,.tag

"===============
"=== Mapkeys ===
"===============

inoremap ( ()<++><ESC>5ha
inoremap [ []<++><ESC>5ha
inoremap { {}<++><ESC>5ha
autocmd Filetype css inoremap [ <SPACE>{<CR><CR>}<CR><CR><++><ESC>3kA<SPACE><SPACE><SPACE><SPACE>
inoremap <LEADER><Del> <ESC>lc5l
vnoremap y "*y

inoremap ;f <Esc>/<++><CR>:nohlsearch<CR>c4l
inoremap ;q <ESC>
inoremap "= "===<CR>===<SPACE><CR>===<CR><ESC>0C<CR><++><ESC>3kA

map <LEADER>fd /\(\<\w\+\)\_s*\1
noremap <LEADER><CR> :nohlsearch<CR>

noremap <C-N> :tabe<CR>
" Move around tabs with tn and ti
noremap tb :-tabnext<CR>
noremap tn :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmb :-tabmove<CR>
noremap tmn :+tabmove<CR>

noremap tk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap tj :set splitbelow<CR>:split<CR>
noremap th :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap tl :set splitright<CR>:vsplit<CR>

noremap `<up> :res +5<CR>
noremap `<down> :res -5<CR>
noremap `<left> :vertical resize-5<CR>
noremap `<right> :vertical resize+5<CR>

"==============
"=== Plugin ===
"==============

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
Plug 'sheerun/vim-polyglot'

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

call plug#end()

" 编译调用的插件
map <Leader>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc

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

autocmd Filetype markdown inoremap ;n ---<Enter><Enter>
autocmd Filetype markdown inoremap ;b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ;s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap ;i ** <++><Esc>F*i
autocmd Filetype markdown inoremap ;d `` <++><Esc>F`i
autocmd Filetype markdown inoremap ;c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ;h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ;p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ;a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ;1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;5 #####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;6 ######<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;l --------<Enter>
