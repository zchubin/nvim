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
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

"=============================================================================================

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

"=============================================================================================

" 使用 <CR> 确认补全
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" 使用 <CR> 确认补全，并触发 coc.nvim 的 formatOnType 功能:
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
                        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <silent> <CR> <Plug>(coc-openlink)

"=============================================================================================

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> <Leader>k :call <SID>show_documentation()<CR>

"=============================================================================================

let g:coc_snippet_next = '<tab>'
" 触发代码展开
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
imap <C-j> <Plug>(coc-snippets-expand-jump)
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
let g:coc_snippet_next = '<c-j>'
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:coc_snippet_prev = '<c-k>'

"=============================================================================================

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

"=============================================================================================

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>cw <Plug>(coc-rename)

"=============================================================================================

nmap ;tt :CocCommand explorer<CR>
" coc-translator
nmap ts <Plug>(coc-translator-p)

vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

"=============================================================================================

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

"=============================================================================================

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

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

"=============================================================================================
" Using CocList
" Show all diagnostics
nnoremap <silent> ;a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> ;e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> ;c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> ;o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> ;s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> ;j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> ;k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> ;p  :<C-u>CocListResume<CR>
