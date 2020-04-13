" ==========================
" === Terminal Behaviors ===
" ==========================
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'
augroup TermHandling
  autocmd!
  " Turn off line numbers, listchars, auto enter insert mode and map esc to
  " exit insert mode
  autocmd TermOpen * setlocal listchars= nonumber norelativenumber
    \ | startinsert
  autocmd FileType fzf call LayoutTerm(0.6, 'horizontal')
augroup END

function! LayoutTerm(size, orientation) abort
  let timeout = 16.0
  let animation_total = 120.0
  let timer = {
    \ 'size': a:size,
    \ 'step': 1,
    \ 'steps': animation_total / timeout
  \}

  if a:orientation == 'horizontal'
    resize 1
    function! timer.f(timer)
      execute 'resize ' . string(&lines * self.size * (self.step / self.steps))
      let self.step += 1
    endfunction
  else
    vertical resize 1
    function! timer.f(timer)
      execute 'vertical resize ' . string(&columns * self.size * (self.step / self.steps))
      let self.step += 1
    endfunction
  endif
  call timer_start(float2nr(timeout), timer.f, {'repeat': float2nr(timer.steps)})
endfunction

" Open autoclosing terminal, with optional size and orientation
function! OpenTerm(cmd, ...) abort
  let orientation = get(a:, 2, 'horizontal')
  if orientation == 'horizontal'
    new | wincmd J
  else
    vnew | wincmd L
  endif
  call LayoutTerm(get(a:, 1, 0.5), orientation)
  call termopen(a:cmd, {'on_exit': {j,c,e -> execute('if c == 0 | close | endif')}})
endfunction

"=========================
"=== 功能键超时（毫秒）===
"=========================

if &ttimeoutlen > 50 || &ttimeoutlen <= 0
	set ttimeoutlen=50
endif

"=========================
"=== 终端下允许 ALT    ===
"=== 记得设置 ttimeout ===
"=========================

if has('nvim') == 0 && has('gui_running') == 0
	function! s:metacode(key)
		exec "set <M-".a:key.">=\e".a:key
	endfunc
	for i in range(10)
		call s:metacode(nr2char(char2nr('0') + i))
	endfor
	for i in range(26)
		call s:metacode(nr2char(char2nr('a') + i))
		call s:metacode(nr2char(char2nr('A') + i))
	endfor
	for c in [',', '.', '/', ';', '{', '}']
		call s:metacode(c)
	endfor
	for c in ['?', ':', '-', '_', '+', '=', "'"]
		call s:metacode(c)
	endfor
endif

"========================
"=== 终端下功能键设置 ===
"========================

function! s:key_escape(name, code)
	if has('nvim') == 0 && has('gui_running') == 0
		exec "set ".a:name."=\e".a:code
	endif
endfunc

"========================
"=== 功能键终端码矫正 ===
"========================

call s:key_escape('<F1>', 'OP')
call s:key_escape('<F2>', 'OQ')
call s:key_escape('<F3>', 'OR')
call s:key_escape('<F4>', 'OS')
call s:key_escape('<S-F1>', '[1;2P')
call s:key_escape('<S-F2>', '[1;2Q')
call s:key_escape('<S-F3>', '[1;2R')
call s:key_escape('<S-F4>', '[1;2S')
call s:key_escape('<S-F5>', '[15;2~')
call s:key_escape('<S-F6>', '[17;2~')
call s:key_escape('<S-F7>', '[18;2~')
call s:key_escape('<S-F8>', '[19;2~')
call s:key_escape('<S-F9>', '[20;2~')
call s:key_escape('<S-F10>', '[21;2~')
call s:key_escape('<S-F11>', '[23;2~')
call s:key_escape('<S-F12>', '[24;2~')

"================
"=== 配置微调 ===
"================

" 打开文件时恢复上一次光标所在位置
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\	 exe "normal! g`\"" |
	\ endif

" 定义一个 DiffOrig 命令用于查看文件改动
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

"====================
"=== 文件类型微调 ===
"====================

augroup InitFileTypesGroup

	" 清除同组的历史 autocommand
	autocmd!

	" C/C++ 文件使用 // 作为注释
	autocmd FileType c,cpp setlocal commentstring=//\ %s
    " 为 json 文件添加正确的注释高亮
    autocmd FileType json syntax match Comment +\/\/.\+$+

	" markdown 允许自动换行
	" au FileType markdown setlocal wrap

	" lisp 进行微调
	autocmd FileType lisp setlocal ts=8 sts=2 sw=2 et

	" scala 微调
	autocmd FileType scala setlocal sts=4 sw=4 noet

	" haskell 进行微调
	autocmd FileType haskell setlocal et

	" quickfix 隐藏行号
	autocmd FileType qf setlocal nonumber

	" 强制对某些扩展名的 filetype 进行纠正
	autocmd BufNewFile,BufRead *.as setlocal filetype=actionscript
	autocmd BufNewFile,BufRead *.pro setlocal filetype=prolog
	autocmd BufNewFile,BufRead *.es setlocal filetype=erlang
	autocmd BufNewFile,BufRead *.asc setlocal filetype=asciidoc
	autocmd BufNewFile,BufRead *.vl setlocal filetype=verilog

    autocmd BufNewFile,BufRead */playbooks/*.{yml,yaml} setfiletype yaml.ansible
	autocmd BufNewFile,BufRead */inventory/*            setfiletype ansible_hosts

	autocmd BufNewFile,BufRead *.hcl                setfiletype terraform
	autocmd BufNewFile,BufRead yarn.lock            setfiletype yaml
	autocmd BufNewFile,BufRead */.kube/config       setfiletype yaml
	autocmd BufNewFile,BufRead *.postman_collection setfiletype json
	autocmd BufNewFile,BufRead .tern-{project,port} setfiletype json
	autocmd BufNewFile,BufRead *.js.map             setfiletype json
	autocmd BufNewFile,BufRead .jsbeautifyrc        setfiletype json
	autocmd BufNewFile,BufRead .eslintrc            setfiletype json
	autocmd BufNewFile,BufRead .jscsrc              setfiletype json
	autocmd BufNewFile,BufRead .babelrc             setfiletype json
	autocmd BufNewFile,BufRead .watchmanconfig      setfiletype json
	autocmd BufNewFile,BufRead .buckconfig          setfiletype toml
	autocmd BufNewFile,BufRead .flowconfig          setfiletype ini
	autocmd BufNewFile,BufRead Jenkinsfile*         setfiletype groovy
	autocmd BufNewFile,BufRead Tmuxfile,tmux/config setfiletype tmux
	autocmd BufNewFile,BufRead Brewfile             setfiletype ruby

augroup END
