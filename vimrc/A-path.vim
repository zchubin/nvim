" 本机配置文件位置

" 撤销记录
if has('persistent_undo')
    set undofile
    set undodir=$VIM/undo
endif

" 浏览器
let g:mkdp_browser = 'firefox'

" Python
set pyxversion=3
let g:python3_host_skip_check=1
let g:python3_host_prog='D:/Development/Python/Python38/python'

"  ruby
let g:ruby_host_prog='D:/Development/Ruby26-x64/bin/neovim-ruby-host'
" nodejs
let g:node_host_prog='D:/Development/nodejs/node_global/node_modules/neovim'

" coc
" let g:coc_node_path='D:/Development/nodejs/node.exe'
" snipMate
let g:UltiSnipsSnippetDirectories=[$HOME.'$HOME/AppData/Local/nvim/Ultisnips/', 'UltiSnips']
" gitgutter
let g:gitgutter_git_executable='D:/Development/Git/bin/git'
