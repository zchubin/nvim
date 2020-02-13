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

" autocmd BufWritePost $MYVIMRC source $MYVIMRC " 让配置变更立即生效

" 设置中文提示
language messages zh_CN.utf-8

" 设置中文帮助
set helplang=cn
let &termencoding=&encoding

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

" 加载插件
LocalScript vimrc/E-plugins.vim
