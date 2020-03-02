"===
"=== coc.vim
"===

" 如果不设置隐藏,TextEdirt可能会失败
set hidden
" 留出多大空间来显示消息
set cmdheight=2
" 缩短响应时间,提高用户体验
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" :verbose imap <tab> 查看当前<tab>映射
" 防止映射冲突

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 使用 <C-SPACE> 强制触发补全
inoremap <silent><expr> <c-space> coc#refresh()

if has('patch8.1.1068')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
end

nnoremap <silent> if <Plug>(coc-diagnostic-info)
nnoremap <silent> fb <Plug>(coc-diagnostic-prev)
nnoremap <silent> fn <Plug>(coc-diagnostic-next)

nnoremap <silent> fdi <Plug>(coc-definition)     " 定义位置
nnoremap <silent> fdl <Plug>(coc-declaration)    " 声明位置
nnoremap <silent> fil <Plug>(coc-implementation) " 实现位置
nnoremap <silent> frf <Plug>(coc-references)     " 引用位置

nnoremap <silent> <cr> <Plug>(coc-openlink)

nnoremap <silent> <Leader>K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:coc_filetype_map = {
    \ 'html.swig'      : 'html',
    \ 'wxss'           : 'css',
    \ 'javascript.jsx' : 'javascriptreact',
    \ 'typescript.tsx' : 'typescriptreact'
    \ }
