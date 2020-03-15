let g:mapleader="\<Space>"    " 默认<leader>是'\'
let g:maplocalleader=";"

" 高亮行尾空格
highlight ExtraWhitespace ctermbg=DarkRed guibg=DarkRed
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches() " for performance
" 函数通过替换命令删除行尾空格
func! DeleteTrailingWS()
 	exec "normal mz"
	%s/\s\+$//ge
	exec "normal `z"
endfunc
" 保存时自动删除行尾空格
autocmd BufWrite * :call DeleteTrailingWS()
map <leader>w :call DeleteTrailingWS()<CR>

vnoremap y "+y
inoremap <C-s> <ESC>ma:w<CR>'a

inoremap ;f <Esc>/<++><CR>:nohlsearch<CR>c4l
inoremap ;q <ESC>
inoremap <LEADER><Del> <ESC>lc5l

nnoremap <LEADER><CR> :nohlsearch<CR>
nnoremap <LEADER>fd :e $MYVIMRC<CR>
nnoremap <LEADER>fw /\(\<\w\+\)\_s*\1<CR>

noremap tu :tabe<CR>
" Move around tabs with tn and ti
noremap tb :-tabnext<CR>
noremap tn :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmb :-tabmove<CR>
noremap tmn :+tabmove<CR>

noremap tk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap tj :set splitbelow<CR>:split<CR>
noremap th :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap tl :set splitright<CR>:vsplit<CR>
" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

noremap `<up> :res +5<CR>
noremap `<down> :res -5<CR>
noremap `<left> :vertical resize+5<CR>
noremap `<right> :vertical resize-5<CR>

" 编译调用的插件
map <Leader>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
elseif &filetype == 'cpp'
    set splitbelow
    exec "!g++ -std=c++11 % -Wall -o %<"
    :sp
    :res -15
    :term ./%<
elseif &filetype == 'cs'
    exec "!mcs %"
    exec "!time mono %<.exe"
elseif &filetype == 'java'
    exec "!javac -encoding utf-8 %"
    exec "!java %"
elseif &filetype == 'sh'
    :!time bash %
elseif &filetype == 'python'
    set splitbelow
    :sp
    :term python3 %
elseif &filetype == 'html'
    silent! exec "!".g:mkdp_browser." % &"
elseif &filetype == 'markdown'
    exec "MarkdownPreview"
elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
elseif &filetype == 'go'
    set splitbelow
    :sp
    :term go run %
endif
endfunc

"================================

"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)

"<Leader>s 触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>

"<Leader>d 查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>

"=======================================

" :verbose imap <tab> 查看当前<tab>映射
" 防止映射冲突
" 定制补全体验
" 使用 <tab> 触发补全
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
              \ pumvisible() ? "\<C-n>" :
              \ <SID>check_back_space() ? "\<TAB>" :
              \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" 使用 <C-SPACE> 强制触发补全
inoremap <silent><expr> <c-space> coc#refresh()

" 使用 <CR> 确认补全
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
" 使用 <CR> 确认补全，并触发 coc.nvim 的 formatOnType 功能:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <silent> <cr> <Plug>(coc-openlink)

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> <Leader>k :call <SID>show_documentation()<CR>
