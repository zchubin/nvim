"===
"=== coc.vim
"===

" 如果不设置隐藏,TextEdirt可能会失败
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" 留出多大空间来显示消息
set cmdheight=1

" 不要将消息传递给 |ins-completion-menu|.
set shortmess+=c

set updatetime=300
" set signcolumn=yes

" 修正COC
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if

"  Coc-Plugs
let g:coc_global_extensions = [
            \ 'coc-json'       ,
            \ 'coc-html'       , 'coc-css'         ,
            \ 'coc-python'     , 'coc-pyright'     ,
            \ 'coc-tsserver'   ,
            \ 'coc-yank'       ,
            \ 'coc-translator' ,
            \ 'coc-git'        , 'coc-gitignore'   ,
            \ 'coc-explorer'   ,
            \ 'coc-lists'      ,
            \ 'coc-vimlsp'     , 'coc-tailwindcss' ,
            \ 'coc-stylelint'  , 'coc-tslint'      ,
            \ 'coc-sourcekit'
            \ ]

let g:coc_filetype_map = {
            \ 'html.swig'      : 'html',
            \ 'wxss'           : 'css',
            \ 'javascript.jsx' : 'javascriptreact',
            \ 'typescript.tsx' : 'typescriptreact'
            \ }

" Add (Neo)Vim's native statusline support.
" NOTE: `:h coc-status` 查看与提供自定义状态栏的外部插件的集成的帮助
function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"=============================================
"===                <Tab>                  ===
"=== :verbose imap <tab> 查看当前<tab>映射 ===
"===        使用 <Tab> 触发补全            ===
"=============================================

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <LEADER><Tab> coc#refresh()

" 使用 <TAB> 选择范围
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

"=====================
"=== <CR> | <C-g>u ===
"=====================

if has('patch8.1.1068')
    " 使用 'complete_info',如果你的 (Neo)Vim 版本支持
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" 使用 <CR> 确认补全
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" 使用 <CR> 确认补全，并触发 coc.nvim 的 formatOnType 功能:
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
                        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <silent> <CR> <Plug>(coc-openlink)

"=====================
"=== Code Navigate ===
"===   代码导航    ===
"=====================

" 跳转到报错
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigate
nmap <silent> gd <Plug>(coc-definition)      " 代码定义
nmap <silent> gy <Plug>(coc-type-definition) " 代码类型定义
nmap <silent> gi <Plug>(coc-implementation)  " 代码实现
nmap <silent> gr <Plug>(coc-references)      " 代码引用

" 查看帮助
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> <Leader>k :call <SID>show_documentation()<CR>

" Highlight the symbol(标识符) and its references(参考文本) when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>cw <Plug>(coc-rename)

" 格式化代码片段
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

"==================
"=== codeAction ===
"==================

augroup mygroup
    autocmd!
    " 设置 formatexpr 指定的文件类型
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " 跳转占位符更新签名帮助
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" 为选定范围添加代码功能
xmap <leader>ca <Plug>(coc-codeaction-selected)
nmap <leader>ca <Plug>(coc-codeaction-selected)

" 为当前行添加 codeAction
nmap <leader>ac  <Plug>(coc-codeaction)
" 自动修复当前行问题
nmap <leader>qf  <Plug>(coc-fix-current)

"============================
"=== Function Text Object ===
"===     功能文本对象     ===
"============================
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

"================
"=== 命令模式 ===
"================

" `:Format` 命令格式化当前缓冲区
command! -nargs=0 Format :call CocAction('format')
" `:Fold` 命令折叠当前缓冲区
command! -nargs=? Fold   :call CocAction('fold', <f-args>)
" `:OR` 命令组织导入当前缓冲区
command! -nargs=0 OR     :call CocAction('runCommand', 'editor.action.organizeImport')

"=============================================================================================

"===============
"=== CocList ===
"===============

" Show all diagnostics 展示所有诊断信息
nnoremap <silent> ;A  :<C-u>CocList diagnostics<cr>
" Manage extensions 管理扩展
nnoremap <silent> ;E  :<C-u>CocList extensions<cr>
" Show commands 显示命令
nnoremap <silent> ;C  :<C-u>CocList commands<cr>
" Find symbol of current document 查看当前文档的标记
nnoremap <silent> ;O  :<C-u>CocList outline<cr>
" Search workspace symbols 查找工作区标记
nnoremap <silent> ;S  :<C-u>CocList -I symbols<cr>
" Do default action for next item. 对下项目执行默认操作
nnoremap <silent> ;J  :<C-u>CocNext<CR>
" Do default action for previous item. 对上一项执行默认操作
nnoremap <silent> ;K  :<C-u>CocPrev<CR>
" Show commands 显示命令
nnoremap <silent> ;P  :<C-u>CocListResume<CR>

"================
"=== coc-yank ===
"================

hi HighlightedyankRegion term=bold ctermbg=0 guibg=#F75C2F
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

"======================
"=== coc-translator ===
"======================

" popup 弹出
nmap <Leader>t <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-pv)
" echo 发音
nmap <Leader>te <Plug>(coc-translator-e)
vmap <Leader>te <Plug>(coc-translator-ev)
" replace 替换
nmap <Leader>tr <Plug>(coc-translator-r)
vmap <Leader>tr <Plug>(coc-translator-rv)

"=============================================================================================

" call CocRequest('tslint', 'textDocument/tslint/allFixes',
    " \  {'textDocument': {'uri': 'file:///tmp'}})

function! s:LoadClojureContent(uri)
    setfiletype clojure
    let content = CocRequest('clojure-lsp', 'clojure/dependencyContents', {'uri': a:uri})
    call setline(1, split(content, "\n"))
    setl nomodified
    setl readonly
endfunction
autocmd BufReadCmd,FileReadCmd,SourceCmd jar:file://* call s:LoadClojureContent(expand("<amatch>"))

"====================
"=== coc-snippets ===
"====================

let g:coc_snippet_next = '<tab>'
" 触发代码展开
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
imap <C-j> <Plug>(coc-snippets-expand-jump)
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
let g:coc_snippet_next = '<c-j>'
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:coc_snippet_prev = '<c-k>'

"===============
"=== coc-git ===
"===============

" navigate chunks of current buffer
nmap {g <Plug>(coc-git-prevchunk)
nmap }g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gd <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

"====================
"=== coc-explorer ===
"====================

nmap ee :CocCommand explorer<CR>
