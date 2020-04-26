"========================
"=== 禁用 vi 兼容模式 ===
"========================
set nocompatible

"====================
"=== 自动配置插件 ===
"====================

if empty(glob('$HOME/AppData/Local/nvim/autoload/plug.vim'))
    silent !curl -fLo $HOME/AppData/Local/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $VIMRC
endif

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

" 取得本文件所在的目录
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
" 定义一个命令用来加载文件
command! -nargs=1 LocalScript exec 'so '.s:home.'/'.'<args>'
" 将本目录加入 runtimepath
exec 'set rtp+='.s:home

let has_machine_specific_file = 1
if empty(glob('$HOME/AppData/Local/nvim/vimrc/A-path.vim'))
    let has_machine_specific_file = 0
    silent! exec "!nvim $HOME/AppData/Local/nvim/vimrc/A-path.vim"
endif

" autocmd BufWritePost $MYVIMRC source $MYVIMRC " 让配置变更立即生效

"============
"=== 模块 ===
"============

" 加载环境配置
LocalScript vimrc/A-path.vim

" 加载基础配置
LocalScript vimrc/B-basic.vim

" 加载调整配置
LocalScript vimrc/C-vimconfig.vim

" 自定义按键
LocalScript vimrc/D-keymaps.vim

call plug#begin('$HOME/AppData/Local/nvim/plugged')

" 向各种 vim 插件提供文件类型标志符号 ( 图标 )
Plug 'ryanoasis/vim-devicons'

" 为 (N)vim 更改开始屏幕
Plug 'mhinz/vim-startify'

" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'itchyny/lightline.vim'

" Snipets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" coc补全框架
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 显示复制范围
" Plug 'machakann/vim-highlightedyank'
" let g:highlightedyank_highlight_duration = 100

" 给关键字添加下划线，方便关注
Plug 'vim-scripts/vim-cursorword'
" 自动匹配括号
Plug 'jiangmiao/auto-pairs'
" 突出显示括号方阵
Plug 'ccampbell/rainbow'
" 快速添加包围符号
Plug 'tpope/vim-surround'
" 模糊查找工具
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" 缩进线
Plug 'Yggdroot/indentLine'
" Plug 'nathanaelkane/vim-indent-guides'

" 快速添加项目符号
Plug 'dkarter/bullets.vim'
let g:bullets_mapping_leader = '<SPACE>'
let g:bullets_enabled_file_types = [ 'markdown', 'text', 'gitcommit', 'scratch']

" 快速注释
Plug 'preservim/nerdcommenter'
" 快速对齐对 markdown 表格尤为友好
Plug 'godlygeek/tabular'
" 多项选择修改
Plug 'terryma/vim-multiple-cursors'
" 拼写检查
Plug 'dense-analysis/ale'
" 按键提示
Plug 'liuchengxu/vim-which-key'

" NERDTree
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" html, css, javascript, php, json, etc.
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'markdown', 'javascript', 'json'] }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'css'] }
Plug 'gko/vim-coloresque', { 'for': ['html', 'css', 'less', 'sass'] }
" plug 'elzr/vim-json'
" plug 'spf13/piv', { 'for' :['php', 'vim-plug'] }
" plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" plug 'maxmellon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }

" markdown
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  } " If you have nodejs and yarn
Plug 'hotoo/pangu.vim'
" autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

" python
Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }

let g:SimpylFold_docstring_preview = 1

" git
Plug 'airblade/vim-gitgutter'

call plug#end()

LocalScript vimrc/Plugs/devicons.vim
LocalScript vimrc/Plugs/startify.vim
LocalScript vimrc/Plugs/airline.vim
LocalScript vimrc/Plugs/snippets.vim
" LocalScript vimrc/Plugs/lightline.vim
LocalScript vimrc/Plugs/coc.vim
LocalScript vimrc/Plugs/rainbow.vim
LocalScript vimrc/Plugs/leaderF.vim
LocalScript vimrc/Plugs/indentLine.vim
" LocalScript vimrc/Plugs/vimIndentGuides.vim
LocalScript vimrc/Plugs/nerdCommenter.vim
LocalScript vimrc/Plugs/tabular.vim
LocalScript vimrc/Plugs/ale.vim
LocalScript vimrc/Plugs/whichkeys.vim
LocalScript vimrc/Plugs/nerdTree.vim
LocalScript vimrc/Plugs/emmet.vim
LocalScript vimrc/Plugs/markdown.vim
LocalScript vimrc/Plugs/gitgutter.vim
