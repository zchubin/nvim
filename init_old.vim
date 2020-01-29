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
if empty(glob('~/AppData/Local/nvim/autoload/plug.vim'))
silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"===================
"=== specialized ===
"===================

"source ~/.vim/snippits.vim
"source ~/.vim/markdown.vim
"source ~/.vim/map.vim
"source C:\Users\zhong\AppData\Local\nvim\autoload\plug.vim

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
"set guifont=source_code_pro_medium:20

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

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

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

"hi Normal ctermfg=252 ctermbg=none
"set statusline=%1*\%<%.50F\             "显示文件名和文件路径 (%<应该可以去掉)
"set statusline+=%=%2*\%y%m%r%h%w\ %*        "显示文件类型及文件状态
"set statusline+=%3*\%{&ff}\[%{&fenc}]\ %*   "显示文件编码类型
"set statusline+=%4*\ row:%l/%L,col:%c\ %*   "显示光标所在行和列
"set statusline+=%5*\%3p%%\%*            "显示光标前文本所占总文本的比例

set statusline=%{LinterStatus()}
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2
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

" inoremap ' ''<ESC>i
" inoremap " ""<ESC>i
" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap { {<CR>}<ESC>O<Tab>

inoremap --- <++>
inoremap === "===<CR>"===<Space><CR>"===<Enter><Enter><++><ESC>3kA
imap ;q <ESC>

let mapleader=" "
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
noremap <LEADER><CR> :nohlsearch<CR>
map <LEADER>fd /\(\<\w\+\)\_s*\1

"ctr-a/c/z/s
inoremap <C-A> <ESC>mmggVG
vmap <C-C> "*y<ESC>'mA
inoremap <C-Z> <ESC>ui
inoremap <C-S> <ESC>:w<CR>A

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

noremap <LWADER><up> :res +5<CR>
noremap <LWADER><down> :res -5<CR>
noremap <LWADER><left> :vertical resize-5<CR>
noremap <LWADER><right> :vertical resize+5<CR>

inoremap ;f <Esc>/<++><CR>:nohlsearch<CR>c4l
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

"""""""""""""""""""""""""""""""""""""""""
"                     _                 "
"             __   __(_)_ __ ___        "
"        _____\ \ / /| | '_ ` _ \       "
"       |_____|\ V / | | | | | | |      "
"               \_/  |_|_| |_| |_|      "
"""""""""""""""""""""""""""""""""""""""""
" 编译调用的插件
"map r :call CompileRunGcc()<CR>
"func! CompileRunGcc()
"  exec "w"
"  if &filetype == 'c'
"    exec "!g++ % -o %<"
"    exec "!time ./%<"
"  elseif &filetype == 'cpp'
"    exec "!g++ % -o %<"
"    exec "!time ./%<"
"  elseif &filetype == 'java'
"    exec "!javac %"
"    exec "!time java %<"
"  elseif &filetype == 'sh'
"    :!time bash %
"  elseif &filetype == 'python'
"    silent! exec "!clear"
"    exec "!time python3 %"
"  elseif &filetype == 'html'
"    exec "!firefox % &"
"  elseif &filetype == 'markdown'
"    exec "MarkdownPreview"
"  elseif &filetype == 'vimwiki'
"    exec "MarkdownPreview"
"  endif
"endfunc

call plug#begin('~/AppData/Local/nvim/plugged')

" 主题
Plug 'rakr/vim-one'
" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 侧边栏，文件目录
Plug 'preservim/nerdtree'

" 给关键字添加下划线，方便关注
Plug 'vim-scripts/vim-cursorword'

" emmet快速补齐
Plug 'mattn/emmet-vim',
" 智能匹配
Plug 'tmsvg/pear-tree'

" 突出显示括号方阵
Plug 'ccampbell/rainbow'
" css3颜色显示
Plug 'gko/vim-coloresque'

" 快速注释
Plug 'preservim/nerdcommenter'
" 拼写检查
Plug 'dense-analysis/ale'

" 自定义补全
" 跟踪引擎
" Plug 'SirVer/ultisnips'
" 片段与引擎分离
" Plug 'honza/vim-snippets'

" markdown
Plug 'jamshedvesuna/vim-markdown-preview', { 'for' :['markdown', 'vim-plug', 'html'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() },  'for' :['markdown', 'vim-plug'] }

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

" 配合拼写检查插件ale，将提示信息整合到airline栏
let s:error_symbol = get(g:, 'airline#extensions#ale#error_symbol', '✗ ')
let s:warning_symbol = get(g:, 'airline#extensions#ale#warning_symbol', '⚡ ')

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
"=== pear tree
"===

" 默认匹配规则
let g:pear_tree_pairs = {
            \ '(': {'closer': ')'},
            \ '[': {'closer': ']'},
            \ '{': {'closer': '}'},
            \ "'": {'closer': "'"},
            \ '"': {'closer': '"'}
            \ }

" 默认启用
let g:pear_tree_ft_disabled = []

" Pair expansion is dot-repeatable by default:
let g:pear_tree_repeatable_expand = 1

" Smart pairs are disabled by default:
let g:pear_tree_smart_openers = 0
let g:pear_tree_smart_closers = 0
let g:pear_tree_smart_backspace = 0

" If enabled, smart pair functions timeout after 60ms:
let g:pear_tree_timeout = 60

" Automatically map <BS>, <CR>, and <Esc>
let g:pear_tree_map_special_keys = 1

" Default mappings:
imap <BS> <Plug>(PearTreeBackspace)
imap <CR> <Plug>(PearTreeExpand)
imap <Esc> <Plug>(PearTreeFinishExpansion)

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

" ale 整合到 airline
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \  '%dW %dE',
    \  all_non_errors,
    \  all_errors
    \)
endfunction

"===
"=== snippet
"===

" 触发器, 如果使用YouCompleteMe, 不要使用 <Tab>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

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

" 缓冲区写入时显示图像
let vim_markdown_preview_toggle=2

let vim_markdown_preview_browser='Mozilla Firefox'

" 使用 GitHub 风格的 markdown
let vim_markdown_preview_github=1
" 使用 John Gruber 风格的 markdown
"let vim_markdown_preview_perl=1

" 使用 John MacFarlane's Pandoc 风格的 HTML
let vim_markdown_preview_pandoc=1

" 如果你的浏览器不附带 see 而想使用 xdg-open, 进行如下设置
let vim_markdown_preview_use_xdg_open=1


