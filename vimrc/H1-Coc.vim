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

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" 使用 <c-space> 触发 刷新
inoremap <silent><expr> <c-space> coc#refresh()

" 使用<cr>确认完成，`<C-g> u`表示在当前位置断开撤消链。
" Coc仅在确认时进行摘要和其他编辑。
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" 使用 `[g` and `]g` 浏览诊断
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation. Goto 代码导航
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 使用 K 在预览窗口显示文档
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" 光标悬停时,突出显示符号及其参考
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming. 标记符号重命名
nmap <leader>rn <Plug>(coc-rename)

" 格式化选中代码
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  " 设置 formatexpr 指定的文件类型
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  " 在跳转占位符上更新签名帮助。
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" 将codeAction应用于所选区域。
" 示例：当前段落的<leader> aap
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" 重新映射用于将codeAction应用于当前行的键。
nmap <leader> ac <Plug>（coc-codeaction）
" 将AutoFix应用于当前行的问题。
nmap <leader> qf <Plug>（coc-fix-current）


" 介绍功能文本对象
" 注意：需要语言服务器的'textDocument.documentSymbol'支持。
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" 将<TAB>用于选择范围。
" 注意：需要语言服务器的'textDocument / selectionRange'支持。
"  coc-tsserver，coc-python是支持它的服务器的示例。
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" 添加`：Format`命令来格式化当前缓冲区。
command! -nargs=0 Format :call CocAction('format')

" 添加`：Fold`命令来折叠当前缓冲区。
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" 添加`：OR`命令来组织当前缓冲区的导入
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" 添加（Neo）Vim的本机状态行支持。
" 注意：请参阅`：h coc-status`以了解与外部插件的集成，
" 提供自定义状态栏：lightline.vim，vim-airline。
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" 使用CoCList的映射：
" 显示所有诊断。
nnoremap <silent> <space> a：<C-u> CocList诊断<cr>
" 管理扩展程序。
nnoremap <silent> <space> e：<C-u> CocList扩展<cr>
" 显示命令。
nnoremap <silent> <space> c：<C-u> CocList命令<cr>
" 查找当前文档的符号。
nnoremap <silent> <space> o：<C-u> CocList轮廓<cr>
" 搜索工作区符号。
nnoremap <silent> <space> s：<C-u> CocList -I符号<cr>
" 对下一项执行默认操作。
nnoremap <silent> <space> j：<C-u> CocNext <CR>
" 对上一项执行默认操作。
nnoremap <silent> <space> k：<C-u> CocPrev <CR>
" 恢复最新的coc列表。
nnoremap <silent> <space> p：<C-u> CocListResume <CR>“将<TAB>用于选择范围。
" 注意：需要语言服务器的'textDocument / selectionRange'支持。
" coc-tsserver，coc-python是支持它的服务器的示例。
nmap <沉默> <TAB> <插件>（coc-range-select）
xmap <silent> <TAB> <Plug>（coc-range-select）
