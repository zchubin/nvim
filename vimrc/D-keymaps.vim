let g:mapleader="\<Space>"    " 默认<leader>是'\'
let g:maplocalleader=";"

" 允许输入错误
cnoreabbrev qw wq
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev bD bd

vnoremap y "+y
inoremap <C-s> <ESC>ma:w<CR>'a
nnoremap <C-s> <ESC>ma:w<CR>'a
xnoremap <C-s> :<C-u>write<CR>
cnoremap <C-s> <C-u>write<CR>

" nnoremap < <<
" nnoremap > >>

inoremap ;f <Esc>/<++><CR>:nohlsearch<CR>c4l
inoremap ;q <ESC>
inoremap <LEADER><Del> <ESC>c4l
nnoremap <lEADER>q :q<CR>
nnoremap <lEADER>Q :q!<CR>

nnoremap <LEADER><CR> :nohlsearch<CR>
nnoremap <LEADER>fd :e $MYVIMRC<CR>
nnoremap <LEADER>fw /\(\<\w\+\)\_s*\1<CR>

noremap tu :tabe<CR>
noremap tb :-tabnext<CR>
noremap tn :+tabnext<CR>
noremap tmb :-tabmove<CR>
noremap tmn :+tabmove<CR>

noremap tk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap tj :set splitbelow<CR>:split<CR>
noremap th :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap tl :set splitright<CR>:vsplit<CR>
noremap sh <C-w>t<C-w>K
noremap sv <C-w>t<C-w>H
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

noremap <C-w> <C-w>w

noremap `<up> :res +5<CR>
noremap `<down> :res -5<CR>
noremap `<left> :vertical resize+5<CR>
noremap `<right> :vertical resize-5<CR>

noremap `<ESC> :set nonumber<CR>:set norelativenumber<CR>:set signcolumn=no<CR>
noremap `<Tab> :set signcolumn=no<CR>
noremap `<CR> :set signcolumn=yes<CR>
noremap `0 :set relativenumber<CR>
noremap `1 :set nonumber!<CR>:set foldcolumn=0<CR>
noremap `2 :set spell!<CR>

" 在不切换输入法时输入中文符号
inoremap <LEADER>\\ 、
inoremap <LEADER>.. 。
inoremap <LEADER>-- ——

" Yank buffer's relative/absolute path to clipboard
" nnoremap `y :let @+=expand("%:~:.")<CR>:echo 'Yanked relative path'<CR>
" nnoremap `Y :let @+=expand("%:p")<CR>:echo 'Yanked absolute path'<CR>

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

map <LEADER>w :call DeleteTrailingWS()<CR>
nmap <silent> `9 :<C-u>call <SID>toggle_background()<CR>
noremap <lEADER>rr :call CompileRunGcc()<CR>

" 编译调用的插件
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
	elseif &filetype == 'java'
        exec "!javac -encoding utf-8 %"
		exec "!time java %<"
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
    " elseif &filetype == 'vimwiki'
    "     exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	endif
endfunc

function! s:toggle_background()
	if ! exists('g:colors_name')
		echomsg 'No colorscheme set'
		return
	endif
	let l:scheme = g:colors_name

	if l:scheme =~# 'dark' || l:scheme =~# 'light'
		" Rotate between different theme backgrounds
		execute 'colorscheme' (l:scheme =~# 'dark'
					\ ? substitute(l:scheme, 'dark', 'light', '')
					\ : substitute(l:scheme, 'light', 'dark', ''))
	else
		execute 'set background='.(&background ==# 'dark' ? 'light' : 'dark')
		if ! exists('g:colors_name')
			execute 'colorscheme' l:scheme
			echomsg 'The colorscheme `'.l:scheme
				\ .'` doesn''t have background variants!'
		else
			echo 'Set colorscheme to '.&background.' mode'
		endif
	endif
endfunction
