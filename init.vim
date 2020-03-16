if empty(glob('$HOME/AppData/Local/nvim/autoload/plug.vim'))
    silent !curl -fLo $HOME/AppData/Local/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $VIMRC
endif

set updatetime=300
"============================
"=== 防止重复加载相同配置 ===
"============================

if get(s:, 'loaded', 0) != 0
	finish
else
	let s:loaded = 1
endif

"================
"=== 运行环境 ===
"================

" 设置字体
" set guifont=Envy\ Code\ R\ VS:h18
set guifont=GoMono\ Nerd\ Font\ Mono:h18

" 设置中文提示
language messages zh_CN.utf-8

" 设置中文帮助
set helplang=cn
let &termencoding=&encoding

" 256色彩支持
set t_Co=256

set background=dark    " for the dark version
" set background=light " for the light version

colorscheme gruvbox

let g:mkdp_browser = 'firefox'

" 取得本文件所在的目录
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
" 定义一个命令用来加载文件
command! -nargs=1 LocalScript exec 'so '.s:home.'/'.'<args>'
" 将本目录加入 runtimepath
exec 'set rtp+='.s:home

" autocmd BufWritePost $MYVIMRC source $MYVIMRC " 让配置变更立即生效

"============
"=== 模块 ===
"============

" 加载环境配置
" LocalScript vimrc/A-path.vim

" 加载基础配置
LocalScript vimrc/B-basic.vim

" 加载调整配置
LocalScript vimrc/C-vimconfig.vim

" 自定义按键
LocalScript vimrc/D-keymaps.vim

call plug#begin('~/AppData/Local/nvim/plugged')

" 向各种 vim 插件提供文件类型标志符号 ( 图标 )
Plug 'ryanoasis/vim-devicons'

" 为 (N)vim 更改开始屏幕
Plug 'mhinz/vim-startify'

" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 显示复制
Plug 'machakann/vim-highlightedyank'
" coc补全框架
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" ------安装即用-----------------------------------
" 给关键字添加下划线，方便关注
Plug 'vim-scripts/vim-cursorword'
" 自动匹配括号
Plug 'jiangmiao/auto-pairs'
" 快速添加包围符号
Plug 'tpope/vim-surround'
" 模糊查找工具
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" ------需要简单配置---------------------------------
" 快速注释
Plug 'preservim/nerdcommenter'
" 突出显示括号方阵
Plug 'ccampbell/rainbow'
" 快速对齐对 markdown 表格尤为友好
Plug 'godlygeek/tabular'

Plug 'SirVer/ultisnips'
" Optional
Plug 'honza/vim-snippets'

" 拼写检查
Plug 'dense-analysis/ale'
" 语法检查
Plug 'vim-syntastic/syntastic'
" 按键提示
" Plug 'liuchengxu/vim-which-key'
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" NERDTree
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" minimap
" Plug 'severin-lemaignan/vim-minimap'
" Html,css
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'css'] }
" css3颜色显示
Plug 'gko/vim-coloresque', { 'for': ['html', 'css', 'less', 'sass'] }

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }

" python
Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }

" git
Plug 'airblade/vim-gitgutter'

call plug#end()
" 加载插件配置
LocalScript vimrc/E-plugins.vim
" 加载插件配色
LocalScript vimrc/F-color.vim
