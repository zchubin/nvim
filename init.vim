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

set pyxversion=3
let g:python3_host_prog='D:/Pyhton'
let g:mkdp_browser = 'firefox'
" 自动补全字典
set dictionary-=$VIM/dictionary/dic.txt dictionary+=$VIM/dictonary/dic.txt
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
" 设置字体
set guifont=Envy\ Code\ R\ VS:h18
" set guifont=DroidSansMono\ Nerd\ Font\ 18
" 设置为双字宽显示，否则无法完整显示如:☆
set ambiwidth=double
" 设置响应超时
set timeoutlen=500
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
" 设置状态行显示常用信息
" %F 完整文件路径名
" %m 当前缓冲被修改标记
" %m 当前缓冲只读标记
" %h 帮助缓冲标记
" %w 预览缓冲标记
" %Y 文件类型
" %b ASCII值
" %B 十六进制值
" %l 行数
" %v 列数
" %p 当前行数占总行数的的百分比
" %L 总行数
" %{...} 评估表达式的值，并用值代替
" %{"[fenc=".(&fenc==""?&enc:&fenc).((exists("+bomb") && &bomb)?"+":"")."]"} 显示文件编码
" %{&ff} 显示文件类型
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" 设置 laststatus = 0 ，不显式状态行
" 设置 laststatus = 1 ，仅当窗口多于一个时，显示状态行
" 设置 laststatus = 2 ，总是显式状态行
set laststatus=2
set viminfo='10,\"100,:20,%,n~/.viminfo
" 设置中文提示
language messages zh_CN.utf-8
" 设置中文帮助
set helplang=cn
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

if has('persistent_undo')
set undofile
set undodir=$VIM/undo
endif
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
set iskeyword+=_,$,@,%,#,-,.
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
" 让 vim 补全菜单行为与 ide 一致
set completeopt=longest,menu
" 分屏时中间显示分隔线便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 文件压缩时不检测文件内容
:let g:ft_ignnore_pat = '\.\(z\|'
" 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
" 或者 Vim 当前目录包含 .tags 文件
set tags=./.tags;,.tag

" 相当于 i 模式 <C-X><C-K> = <C-N> 查看字典,进行补全
set complete-=k complete+=k
" 使用 <Tab> 进行自动补全
" inoremap <tab> <c-r>=Smart_TabComplete()<CR>
" function! Smart_TabComplete()
" let line = getline('.')                         " current line
"
" let substr = strpart(line, -1, col('.')+1)      " from the start of the current
"                                               " line to one character right
"                                               " of the cursor
" let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
" if (strlen(substr)==0)                          " nothing to match on empty string
" return "\<tab>"
" endif
" let has_period = match(substr, '\.') != -1      " position of period, if any
" let has_slash = match(substr, '\/') != -1       " position of slash, if any
" if (!has_period && !has_slash)
" return "\<C-X>\<C-P>"                         " existing text matching
" elseif ( has_slash )
" return "\<C-X>\<C-F>"                         " file matching
" else
" return "\<C-X>\<C-O>"                         " plugin matching
" endif
" endfunction
"===============
"=== Mapkeys ===
"===============

" inoremap ( ()<++><ESC>5ha
" inoremap [ []<++><ESC>5ha
" inoremap { {}<++><ESC>5ha
" inoremap ' ''<++><ESC>5ha
" inoremap " ""<++><ESC>5ha

" autocmd Filetype css,java inoremap [ <SPACE>{<CR><CR>}<CR><CR><++><ESC>3kA<SPACE><SPACE><SPACE><SPACE>
inoremap <LEADER><Del> <ESC>lc5l
vnoremap y "*y

inoremap ;f <Esc>/<++><CR>:nohlsearch<CR>c4l
inoremap ;q <ESC>
inoremap "= "===<CR>===<SPACE><CR>===<CR><ESC>0C<CR><++><ESC>3kA

map <LEADER>fw /\(\<\w\+\)\_s*\1<CR>
noremap <LEADER><CR> :nohlsearch<CR>

noremap tu :tabe<CR>
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
" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

noremap `<up> :res +5<CR>
noremap `<down> :res -5<CR>
noremap `<left> :vertical resize+5<CR>
noremap `<right> :vertical resize-5<CR>

" 编译调用的插件
map <Leader>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
elseif &filetype == 'cpp'
    set splitbelow
    exec "!g++ -std=c++11 % -Wall -o %<"
    :sp
    :res -15
    :term ./%<
elseif &filetype == 'cs'
    exec "!mcs %"
    exec "!time mono %<.exe"
elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
elseif &filetype == 'sh'
    :!time bash %
elseif &filetype == 'python'
    set splitbelow
    :sp
    :term python3 %
elseif &filetype == 'html'
    silent! exec "!".g:mkdp_browser." % &"
elseif &filetype == 'markdown'
    exec "MarkdownPreview"
elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
elseif &filetype == 'go'
    set splitbelow
    :sp
    :term go run %
endif
endfunc

"==============
"=== Plugin ===
"==============

call plug#begin('~/AppData/Local/nvim/plugged')

" 向各种 vim 插件提供文件类型标志符号 ( 图标 )
Plug 'ryanoasis/vim-devicons'

" 为 (N)vim 更改开始屏幕
Plug 'mhinz/vim-startify'
" 主题
" Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 按键提示
Plug 'liuchengxu/vim-which-key'

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

" 自动匹配括号
Plug 'jiangmiao/auto-pairs'
" 突出显示括号方阵
Plug 'ccampbell/rainbow'

" 快速添加包围符号
Plug 'tpope/vim-surround'
" SnipMate depends on vim-addon-mw-utils and tlib.
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
" Optional:
Plug 'honza/vim-snippets'

" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" css3颜色显示
Plug 'gko/vim-coloresque', { 'for': ['html', 'css', 'less', 'sass'] }

" 快速注释
Plug 'preservim/nerdcommenter'
" 拼写检查
Plug 'dense-analysis/ale'

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() },  'for' :['markdown', 'vim-plug'] }

call plug#end()

"===
"=== devicon
"===
" let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsOS = 'icomoon'
" loading the plugin
let g:webdevicons_enable = 1

" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1

" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1

" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

" adding to vim-startify screen
let g:webdevicons_enable_startify = 1

" turn on/off file node glyph decorations (not particularly useful)
let g:WebDevIconsUnicodeDecorateFileNodes = 1

" use double-width(1) or single-width(0) glyphs
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 0

" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

" Adding the custom source to denite
" let g:webdevicons_enable_denite = 1

" change the default character when no match found
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'

" set a byte character marker (BOM) utf-8 symbol when retrieving file encoding
" disabled by default with no value
let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''

" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" enable pattern matching glyphs on folder/directory (enabled by default with 1)
let g:DevIconsEnableFolderPatternMatching = 1

" enable file extension pattern matching glyphs on folder/directory (disabled by default with 0)
let g:DevIconsEnableFolderExtensionPatternMatching = 1

" enable custom folder/directory glyph exact matching
let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1

"====
"==== Vim-themes
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

" let g:airline_theme='one'
let g:airline_theme='gruvbox'

" colorscheme one
colorscheme gruvbox
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

let g:airline_left_sep = "\uE0B4"
let g:airline_right_sep = "\uE0B6"
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])
"===
"=== startify
"===


"===
"=== vim-which-key
"===

let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:which_key_map =  {}

let g:which_key_map.f = { 'name' : '+file' }

nnoremap <silent> <leader>fd :e $MYVIMRC<CR>
let g:which_key_map.f.d = 'open-vimrc'
let g:which_key_map.f.w = '查找相邻两个相同的单词'

let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : ['resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : ['resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }

let g:which_key_map.c = {
      \ 'name' : '+open',
      \ 'a' : '在可选注释之间切换',
      \ 'A' : '在当前行尾添加注释',
      \ '$' : '在当前光标后添加注释',
      \ 'c' : '注释当前行',
      \ 's' : '使用"sexy"进行注释',
      \ 'u' : '取消注释',
      \ 'm' : '进行块注释',
      \ 'y' : '注释并复制内容',
      \ }

call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

" 自定义提示键位
nnoremap <silent> ` :<c-u>WhichKey '`'<CR>
nnoremap <silent> t :<c-u>WhichKey 't'<CR>
nnoremap <silent> s :<c-u>WhichKey 's'<CR>

" autocmd! FileType which_key
" autocmd  FileType which_key set laststatus=0 noshowmode noruler
  " \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
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
"=== snipMate
"===

let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'

" let g:tex_flavor = "latex"
" inoremap <c-n> <nop>
" let g:UltiSnipsExpandTrigger="<Tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsSnippetDirectories = [$HOME.'~/AppData/Local/nvim/Ultisnips/', 'UltiSnips']
" silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>
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

