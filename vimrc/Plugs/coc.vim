"===
"=== coc.vim
"===

function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Use C to open coc config
call SetupCommandAbbrs('C', 'CocConfig')

" 添加状态栏支持
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:coc_node_path = 'D:/Development/nodejs/node'

" 修正COC Bug
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if

let g:coc_global_extensions = [
            \ 'coc-python'  , 'coc-vimlsp'      , 'coc-html'       ,
            \ 'coc-json'    , 'coc-css'         , 'coc-tsserver'   ,
            \ 'coc-yank'    , 'coc-lists'       , 'coc-gitignore'  ,
            \ 'coc-vimlsp'  , 'coc-tailwindcss' , 'coc-stylelint'  ,
            \ 'coc-tslint'  , 'coc-lists'       , 'coc-git'        ,
            \ 'coc-pyright' , 'coc-sourcekit'   , 'coc-translator' ,
            \ 'coc-explorer'
            \ ]

let g:coc_filetype_map = {
    \ 'html.swig'      : 'html',
    \ 'wxss'           : 'css',
    \ 'javascript.jsx' : 'javascriptreact',
    \ 'typescript.tsx' : 'typescriptreact'
    \ }

"=======================================

" :verbose imap <tab> 查看当前<tab>映射
" 防止映射冲突
" 定制补全体验
" 使用 <tab> 触发补全
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
              \ pumvisible() ? "\<C-n>" :
              \ <SID>check_back_space() ? "\<TAB>" :
              \ pumvisible() ? coc#_select_confirm() :
              \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
              \ <SID>check_back_space() ? "\<TAB>" :
              \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

autocmd CursorHold * silent call CocActionAsync('highlight')

" 使用 <C-SPACE> 强制触发补全
inoremap <silent><expr> <c-space> coc#refresh()

" 使用 <CR> 确认补全
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
" 使用 <CR> 确认补全，并触发 coc.nvim 的 formatOnType 功能:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <silent> <cr> <Plug>(coc-openlink)


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> <Leader>k :call <SID>show_documentation()<CR>

let g:coc_snippet_next = '<tab>'
" 触发代码展开
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
imap <C-j> <Plug>(coc-snippets-expand-jump)
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
let g:coc_snippet_next = '<c-j>'
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:coc_snippet_prev = '<c-k>'

" call CocRequest('tslint', 'textDocument/tslint/allFixes',
    " \  {'textDocument': {'uri': 'file:///tmp'}})

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

