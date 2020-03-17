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
        :term python %
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

