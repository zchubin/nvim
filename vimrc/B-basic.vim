"================
"=== 基础设置 ===
"================

" 禁用 vi 兼容模式
set nocompatible

" 如果不设置隐藏,TextEdirt可能会失败
set hidden
" 留出多大空间来显示消息
set cmdheight=1
" 缩短响应时间,提高用户体验
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" 设置 Backspace 键模式
set bs=eol,start,indent
set whichwrap+=<,>,h,l
set smarttab

" 自动缩进
set autoindent

" 继承前一行缩进方式
set formatoptions=tcrqn

" 设置缩进宽度
set sw=2

" 设置 TAB 宽度
set tw=4

" 如果后面设置了 expandtab 那么展开 tab 为多少字符
set softtabstop=4

" TAB替换为空格：
set expandtab
%retab!

" 禁止展开 tab (noexpandtab)
" set noet

augroup PythonTab
	au!
	" 在 python 里用 tab , 否则 vim 会在打开 py 文件时自动设置成空格缩进
	au FileType python setlocal shiftwidth=4 tabstop=4 noexpandtab
augroup END

" 打开 C/C++ 语言缩进优化
set cindent

" Windows 禁用 ALT 操作菜单（使得 ALT 可以用到 Vim里）
set winaltkeys=no

" 关闭自动换行
set nowrap

" 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
set ttimeout

" 功能键超时检测 50 毫秒
set ttimeoutlen=50

" 显示光标位置
set ruler

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 启用正则表达式
set magic

" 设置行号
set nu
" set relativenumber

" 高亮显示当前行
set cursorline

" 高亮显示当前列
" set cursorcolumn

" 显示符号列
" set signcolumn=yes

" 光标
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" 移动光标上下保持8行行距
set scrolloff=8

" 移动光标左右保留15个字符
set sidescrolloff=15

" 鼠标
if has("mouse") | set mouse=a | endif
set mousemodel=popup

" 相当于 i 模式 <C-X><C-K> = <C-N> 查看字典,进行补全
set complete-=k complete+=k

if has('persistent_undo')
    set undofile
    set undodir=$VIM/undo
endif
set history=1000
set nobackup
set noswapfile

"=================
"==== 搜索设置 ===
"=================

" 搜索时忽略大小写
set ignorecase

" 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
set smartcase

" 高亮搜索内容
set hlsearch

" 查找输入时动态增量显示查找结果
set incsearch

"================
"=== 编码设置 ===
"================

if has('multi_byte')
	" 内部工作编码
	set encoding=utf-8

	" 文件默认编码
	set fileencoding=utf-8

	" 打开文件时自动尝试下面顺序的编码
	set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif

"===================================================
"=== 允许 Vim 自带脚本根据文件类型自动设置缩进等 ===
"===================================================

if has('autocmd')
	filetype plugin indent on
endif
" 仅对 C/C++/Python/Vim 遵循旧式80列限制
autocmd FileType c,cpp,python,vim set textwidth=80

"====================
"=== 语法高亮设置 ===
"====================

if has('syntax')
	syntax enable
	syntax on
endif

"================
"=== 其他设置 ===
"================

" 设置状态行显示常用信息
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P

" 0 ，不显式状态行
" 1 ，仅当窗口多于一个时，显示状态行
" 2 ，总是显式状态行
set laststatus=2

" 单词 = 单词 + 连字符
set iskeyword+=_,$,@,%,#,-,.

" 显示匹配的括号
set showmatch

" 显示括号匹配的时间
set matchtime=2

" 显示最后一行
set display=lastline

" 允许下方显示目录
set wildmenu

" 延迟绘制（提升性能）
set lazyredraw

" 错误格式
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m

" 用▸示缩进,▫显示空格,>显示扩充,<显示回车
set listchars=tab:▸\ ,trail:▫,extends:»,precedes:

" 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
" 或者 Vim 当前目录包含 .tags 文件
set tags=./.tags;,.tags

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m

" 合并两行中文时，不在中间加空格
set formatoptions+=B

" 换行符
if has("win32")
	set fileformats=dos,unix,mac
else
	set fileformats=unix,mac,dos
endif

" TXT/Markdown/XML 等比较需要换行
" autocmd FileType text,html,xml set wrap

" 换行时，以单词为界
set linebreak

" 换行后保持缩进
set breakindent

" 文件被其它编辑器修改后自动载入
set autoread
set autochdir

" 让 vim 补全菜单行为与 ide 一致
set completeopt=longest,menu

" 错误不报警 不显示
set noerrorbells
set visualbell

" 显示最后一行
set display=lastline

" 文件压缩时不检测文件内容
:let g:ft_ignnore_pat = '\.\(z\|'

" 分屏时中间不显示分隔线便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

"====================
"=== 设置代码折叠 ===
"====================

if has('folding')
	" 允许代码折叠
	set foldenable

	" 代码折叠默认使用缩进
	set fdm=indent

	" 默认打开所有缩进
	set foldlevel=99
endif

"======================================
"=== 文件搜索和补全时忽略下面扩展名 ===
"======================================
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
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
