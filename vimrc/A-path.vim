" 本机配置文件位置

" Python
" let g:python_host_prog='/usr/bin/python2'
set pyxversion=3
let g:python3_host_skip_check=1
let g:python3_host_prog= 'D:/Python/python'

" Browser
let g:mkdp_browser = 'firefox'

" Ruby
" let g:ruby_host_prog= 'D:/Ruby26-x64/bin/ruby'

" nodejs
let g:coc_node_path = 'D:/nodejs/node'

" COC.vim
let g:coc_global_extensions = [
            \ 'coc-tsserver','coc-html','coc-css', 'coc-json',
            \ 'coc-java','coc-python','coc-flutter',
            \ 'coc-emmet','coc-snippets','coc-xml','coc-yaml',
            \ 'coc-markdownlint','coc-highlight'
            \ ]
