""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" __  ____   __  _   ___     _____ __  __ ____   ____  "
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___| "
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |     "
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___  "
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____| "
"                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"=====================================
"=== Auto load for first time uses ===
"=====================================

"if empty(glob('~/.config/vim/autoload/plug.vim'))
"silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

"===================
"=== specialized ===
"===================

"source ~/.vim/snippits.vim
"source ~/.vim/markdown.vim
"source ~/.vim/map.vim

"====================
"=== Bash Setting ===
"====================

" 禁用 vi 兼容模式
set nocompatible

" 启用代码高亮
if has('syntax')
	syntax enable
	syntax on
endif
" 高亮匹配对应括号
set showmatch
" 显示括号匹配的时间
set matchtime=2

" 匹配正则表达式
set magic

" 行号
set nu
set relativenumber

" 启用鼠标
"set mouse=a
if has("mouse") | set mouse=a | endif
set mousemodel=popup

" 高亮显示当前行
set cursorline

" 显示当前模式
set showmode
" 显示当前命令
set showcmd
" 允许下方显示目录
set wildmenu
set wildmode=longest:list,full

" 延迟绘制（提升性能）
set lazyredraw

" 启用 <Backspace>
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
" <Backspace> 可删除 <Tab>
"sm = smartident
set smarttab

" 合并两行中文时不加入空格
"fo = formatoptions
set fo+=mB

" 单词如果含有 +=_,$,@,%,#,- 看作一个单词
set iskeyword+=_,$,@,%,#,-

" 分屏时中间显示分隔线便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

" 使用 十进制 00x
set nrformats=

" 显示光标位置
set ruler

set indentexpr=

"font-size=18
"linux
"set guifont=Monaco\\ 18
"windows
set guifont=Monaco:20

if has('multi_byte')
	" 内部工作编码
	set encoding=utf-8

	" 文件默认编码
	set fileencoding=utf-8

    	" 打开文件时自动匹配字符编码顺序
   	 set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,big5,euc-jp,euc-kr,latin1
endif

" vim显示信息
language messages zh_CN.utf-8
let &termencoding=&encoding

filetype on
filetype indent on
filetype plugin on
if has('autocmd')
	filetype plugin indent on
endif

:let g:ft_ignnore_pat = '\.\(z\|'
set completeopt=longest,menu
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
"使用C/C++缩进
set cindent
augroup PythonTab
	au!
	" 如果你不需要 python 里用 tab，
   	 " 那么注释下面这行字，
   	 " 否则vim会在打开py文件时自动设置成空格缩进。
	au FileType python setlocal shiftwidth=4 tabstop=4 noexpandtab
augroup END

" 启动自动换行
set wrap
" TXT/Markdown/XML 等比较需要折行
"au FileType text,markdown,html,xml set wrap
" 换行符
if has("win32")
    set fileformats=dos,unix,mac
else
    set fileformats=unix,mac,dos
endif
" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 仅对 C/C++/Python/Vim 遵循旧式80列限制
au FileType c,cpp,python,vim set textwidth=80
" 在81列显示分页线
"set colorcolumn=81
" 折行时，以单词为界，以免切断单词
set linebreak
" 折行后的后续行，使用与第一行相同的缩进
set breakindent

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

" 移动光标上下保持8行行距
set scrolloff=8
" 移动光标左右保留15个字符
set sidescrolloff=15

" 显示最后一行
set display=lastline

" 检查’"标记是否已被定义，如果是，则跳转到该标记
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"======================
"=== Vim Status bar ===
"======================

" 背景透明
"hi Normal ctermfg=252 ctermbg=none
"set statusline=%1*\%<%.50F\             "显示文件名和文件路径 (%<应该可以去掉)
"set statusline+=%=%2*\%y%m%r%h%w\ %*        "显示文件类型及文件状态
"set statusline+=%3*\%{&ff}\[%{&fenc}]\ %*   "显示文件编码类型
"set statusline+=%4*\ row:%l/%L,col:%c\ %*   "显示光标所在行和列
"set statusline+=%5*\%3p%%\%*            "显示光标前文本所占总文本的比例

set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set viminfo='10,\"100,:20,%,n~/.viminfo

"==============
"=== Ignore ===
"==============

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

"==============
"=== Search ===
"==============

" 高亮显示搜索结果
set hlsearch
" 查找输入时动态增量显示查找结果
set incsearch
" 搜索时忽略大小写
set ignorecase
" 智能判断大小写
set smartcase

"==============
"=== Editor ===
"==============

set undofile
set history=100

set nobackup
set noswapfile

" 显示不可见字符
set list
" 用▸示缩进,▫显示空格,>显示扩充,<显示回车
set listchars=tab:▸\ ,trail:▫,extends:>,precedes:<

" 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
" 或者 Vim 当前目录包含 .tags 文件
set tags=./.tags;,.tag

"Automatically switch working directories
set autochdir

"Don't alarm,screen display
set noerrorbells
set visualbell

" 文件被其它编辑器修改后自动载入
set autoread

" 错误格式
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m

" 对文件格式进行微调
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

"====================
"=== Cursor style ===
"====================

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"=************************************************************************************************
"=* ┌───┐   ┌───┬───┬───┬───┐ ┌───┬───┬───┬───┐ ┌───┬───┬───┬───┐ ┌───┬───┬───┐                  *
"=* │Esc│   │ F1│ F2│ F3│ F4│ │ F5│ F6│ F7│ F8│ │ F9│F10│F11│F12│ │P/S│S L│P/B│  ┌┐    ┌┐    ┌┐  *
"=* └───┘   └───┴───┴───┴───┘ └───┴───┴───┴───┘ └───┴───┴───┴───┘ └───┴───┴───┘  └┘    └┘    └┘  *
"=*┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───────┐ ┌───┬───┬───┐ ┌───┬───┬───┬───┐ *
"=*│~ `│! 1│@ 2│# 3│$ 4│% 5│^ 6│& 7│* 8│( 9│) 0│_ -│+ =│ BacSp │ │Ins│Hom│PUp│ │N L│ / │ * │ - │ *
"=*├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─────┤ ├───┼───┼───┤ ├───┼───┼───┼───┤ *
"=*│ Tab │ Q │ W │ E │ R │ T │ Y │ U │ I │ O │ P │{ [│} ]│ | \ │ │Del│End│PDn│ │ 7 │ 8 │ 9 │   │ *
"=*├─────┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴─────┤ └───┴───┴───┘ ├───┼───┼───┤ + │ *
"=*│ Caps │ A │ S │ D │ F │ G │ H │ J │ K │ L │: ;│" '│ Enter  │               │ 4 │ 5 │ 6 │   │ *
"=*├──────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────────┤     ┌───┐     ├───┼───┼───┼───┤ *
"=*│ Shift  │ Z │ X │ C │ V │ B │ N │ M │< ,│> .│? /│  Shift   │     │ ↑ │     │ 1 │ 2 │ 3 │   │ *
"=*├─────┬──┴─┬─┴──┬┴───┴───┴───┴───┴───┴──┬┴───┼───┴┬────┬────┤ ┌───┼───┼───┐ ├───┴───┼───┤ E││ *
"=*│ Ctrl│    │Alt │         Space         │ Alt│    │    │Ctrl│ │ ← │ ↓ │ → │ │   0   │ . │←─┘│ *
"=*└─────┴────┴────┴───────────────────────┴────┴────┴────┴────┘ └───┴───┴───┘ └───────┴───┴───┘ *
"=************************************************************************************************

"let g:python3_host_prog='**'

inoremap ' ''<ESC>i
""inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O<Tab>

inoremap --- <++>

let mapleader=" "
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
noremap <LEADER><CR> :nohlsearch<CR>

"ctr-a/c/z/s
inoremap <C-a> <ESC>mmggVG
vmap <C-c> "*y<ESC>'mA
inoremap <C-z> <ESC>ui
inoremap <C-s> <ESC>:w<CR>A

noremap <C-n> :tabe<CR>
"" Move around tabs with tn and ti
noremap tb :-tabnext<CR>
noremap tn :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmb :-tabmove<CR>
noremap tmn :+tabmove<CR>

noremap tk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap tj :set splitbelow<CR>:split<CR>
noremap th :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap tl :set splitright<CR>:vsplit<CR>

noremap <LWADER><up> :res +5<CR>
noremap <LWADER><down> :res -5<CR>
noremap <LWADER><left> :vertical resize-5<CR>
noremap <LWADER><right> :vertical resize+5<CR>

" 高亮显示行尾不想要的空格
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches() " for performance

" 这个函数通过替换命令删除行尾空格
func! DeleteTrailingWS()
    exec "normal mz"
    %s/\s\+$//ge
    exec "normal `z"
endfunc
" 保存时自动删除行尾空格
au BufWrite * :call DeleteTrailingWS()
map <leader>W :call DeleteTrailingWS()<CR>

"iabbrev xname <YouName>  " 改成你自己的名字
"iabbrev xmail <YouEmail> " 改成你自己的电邮
"iabbrev xfile <c-r>=expand("%:t")<CR>
"if exists("*strftime")
"    iabbrev xdate <c-r>=strftime("%Y-%m-%d")<CR>  " 当前日期
"    iabbrev xtime <c-r>=strftime("%H:%M:%S")<CR>  " 当前时间
"endif

"""""""""""""""""""""""""""""""""""""""""
"                     _                 "
"             __   __(_)_ __ ___        "
"        _____\ \ / /| | '_ ` _ \       "
"       |_____|\ V / | | | | | | |      "
"               \_/  |_|_| |_| |_|      "
"""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/AppData/Local/nvim/plugged')

"Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'preservim/nerdtree'

call plug#end()

"====
"==== Vim-one
"====

" 真色彩支持
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
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
let g:airline#extensions#tabline#enabled = 1

" 为制表行单独配置分隔符，这是定义'直接'制表符的d方式
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" 路径格式化程序，
" 这会影响文件路径在单独的选项卡中的显示方式以及右上角的当前缓冲区指示符，
" 为此，使用以下命令设置格式器字段：
let g:airline#extensions#tabline#formatter = 'default'

"===
"=== NERDTree
"===

" 打开vim打开nerdtree

map tt :NERDTreeToggle<CR>

"autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" 更改默认箭头
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" 如果唯一打开的窗口时NERDTree,如何关闭vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
