let mapleader=" "    " 默认<leader>是'\'

inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

" inoremap ( ()<++><ESC>5ha
" inoremap [ []<++><ESC>5ha
" inoremap { {}<++><ESC>5ha
" inoremap ' ''<++><ESC>5ha
" inoremap " ""<++><ESC>5ha

" autocmd Filetype css,java inoremap [ <SPACE>{<CR><CR>}<CR><CR><++><ESC>3kA<SPACE><SPACE><SPACE><SPACE>
inoremap <LEADER><Del> <ESC>lc5l
vnoremap y "*y

inoremap ;f <Esc>/<++><CR>:nohlsearch<CR>c4l
inoremap ;q <ESC>
inoremap "= "===<CR>===<SPACE><CR>===<CR><ESC>0C<CR><++><ESC>3kA

map <LEADER>fw /\(\<\w\+\)\_s*\1<CR>
noremap <LEADER><CR> :nohlsearch<CR>

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

"===
"=== markdown-keys
"===

autocmd Filetype markdown inoremap ;1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;5 #####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;6 ######<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;n ---<Enter><Enter>
autocmd Filetype markdown inoremap ;m - [ ] <Enter><++><ESC>kA
autocmd Filetype markdown inoremap ;b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ;s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap ;i ** <++><Esc>F*i
autocmd Filetype markdown inoremap ;d `` <++><Esc>F`i
autocmd Filetype markdown inoremap ;c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ;h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ;p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ;a [](<++>) <++><Esc>F[a
