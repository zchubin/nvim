"==============
"=== Plugin ===
"==============

call plug#begin('~/AppData/Local/nvim/plugged')

" 向各种 vim 插件提供文件类型标志符号 ( 图标 )
Plug 'ryanoasis/vim-devicons'

" 为 (N)vim 更改开始屏幕
Plug 'mhinz/vim-startify'

" 主题
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'machakann/vim-highlightedyank'
" ------安装即用-----------------------------------
" 给关键字添加下划线，方便关注
Plug 'vim-scripts/vim-cursorword'
" 自动匹配括号
Plug 'jiangmiao/auto-pairs'
" 快速添加包围符号
Plug 'tpope/vim-surround'
" ------需要简单配置---------------------------------
" 快速注释
Plug 'preservim/nerdcommenter'
" 突出显示括号方阵
Plug 'ccampbell/rainbow'
" 快速对齐对 markdown 表格尤为友好
Plug 'godlygeek/tabular'

" Plug 'SirVer/ultisnips'
" Optional
" Plug 'honza/vim-snippets'

" 拼写检查
Plug 'dense-analysis/ale'
" 按键提示
Plug 'liuchengxu/vim-which-key'
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" NERDTree
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" Html,css
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'css'] }
" css3颜色显示
Plug 'gko/vim-coloresque', { 'for': ['html', 'css', 'less', 'sass'] }

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() },  'for' :['markdown', 'vim-plug'] }

" coc补全框架
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" git
Plug 'airblade/vim-gitgutter'

call plug#end()

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
       \ ]

let g:startify_bookmarks = [
            \ '~/Desktop/1.txt',
            \ '~/Desktop/2.txt',
            \]

let g:startify_custom_header = [
            \ '+--------------------------------------------+',
            \ '|  b:在不同窗口打开          t:在tab中打开   |',
            \ '|  s:水平切分窗口            v:垂直切分窗口  |',
            \ '+--------------------------------------------+',
            \]

let g:startify_custom_footer = [
            \ '+------------------------------+',
            \ '|  -zchubin-work-menu-         |',
            \ '+------------------------------+',
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
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'
" 启用文件夹/目录字形图标
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

"====
"==== Vim-themes airline vim-highlightedyank
"====

" colors ron
hi PmenuSel ctermbg=lightblue

set background=dark " for the dark version
" set background=light " for the light version

" colorscheme one
colorscheme gruvbox
" highlight HighlightedyankRegion cterm=reverse gui=reverse

" 如果由于某种原因高光不可见，则可以重新定义HighlightedyankRegion高光组
" 请注意，该行应位于vimrc中的：colorscheme命令执行之后。

" 支持斜体
let g:one_allow_italics = 1

" call one#highlight('vimLineComment', '535c68', ' ', 'italic')

" let g:airline_theme='one'
let g:airline_theme='gruvbox'
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
"---------------------------------------------------------------------
" 高亮持续时间
let g:highlightedyank_highlight_duration = 100
