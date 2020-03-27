"===
"=== snipMate
"===

let g:tex_flavor = "latex"
let g:UltiSnipsSnippetDirectories = [$HOME.'~/AppData/Local/nvim/Ultisnips/', 'UltiSnips']

if v:version < 704 || has('win32')
	function! s:Glob(path, expr)
		let res = []
		for p in split(a:path, ',')
			let h = split(fnamemodify(a:expr, ':h'), '/')[0]
			if isdirectory(p . '/' . h)
				call extend(res, split(glob(p . '/' . a:expr), "\n"))
			endif
		endfor
		return filter(res, 'filereadable(v:val)')
	endfunction
else
	function! s:Glob(path, expr)
		return split(globpath(a:path, a:expr), "\n")
	endfunction
endif

if exists('loaded_snips') || &cp || version < 700
	finish
endif
let loaded_snips = 1

" Save and reset 'cpo'
let s:save_cpo = &cpo
set cpo&vim

au BufRead,BufNewFile *.snippet,*.snippets setlocal filetype=snippets
au FileType snippets if expand('<afile>:e') =~# 'snippet$'
				\ | setlocal syntax=snippet
			\ | else
				\ | setlocal syntax=snippets
			\ | endif

inoremap <silent> <Plug>snipMateNextOrTrigger  <C-R>=snipMate#TriggerSnippet()<CR>
snoremap <silent> <Plug>snipMateNextOrTrigger  <Esc>a<C-R>=snipMate#TriggerSnippet()<CR>
inoremap <silent> <Plug>snipMateTrigger        <C-R>=snipMate#TriggerSnippet(1)<CR>
inoremap <silent> <Plug>snipMateBack           <C-R>=snipMate#BackwardsSnippet()<CR>
snoremap <silent> <Plug>snipMateBack           <Esc>a<C-R>=snipMate#BackwardsSnippet()<CR>
inoremap <silent> <Plug>snipMateShow           <C-R>=snipMate#ShowAvailableSnips()<CR>
xnoremap <silent> <Plug>snipMateVisual         :<C-U>call <SID>grab_visual()<CR>gv"_c

" 配置变量
if !exists('g:snips_author')
	let g:snips_author = 'Me'
endif
if !exists('g:snipMate')
	let g:snipMate = {}
endif

" SnipMate inserts this string when no snippet expansion can be done
let g:snipMate['no_match_completion_feedkeys_chars'] =
			\ get(g:snipMate, 'no_match_completion_feedkeys_chars', "\t")

" 添加默认作用域别名，而不覆盖用户设置
let g:snipMate.scope_aliases = get(g:snipMate, 'scope_aliases', {})
if exists('g:snipMate_no_default_aliases')
	echom 'The g:snipMate_no_default_aliases option has been renamed.'
				\ 'See :h snipMate-options.'
endif
if (!exists('g:snipMate_no_default_aliases') || !g:snipMate_no_default_aliases)
			\ && (!exists('g:snipMate.no_default_aliases')
				\ || !g:snipMate.no_default_aliases)
	let g:snipMate.scope_aliases.objc =
				\ get(g:snipMate.scope_aliases, 'objc', 'c')
	let g:snipMate.scope_aliases.cpp =
				\ get(g:snipMate.scope_aliases, 'cpp', 'c')
	let g:snipMate.scope_aliases.cu =
				\ get(g:snipMate.scope_aliases, 'cu', 'c')
	let g:snipMate.scope_aliases.xhtml =
				\ get(g:snipMate.scope_aliases, 'xhtml', 'html')
	let g:snipMate.scope_aliases.html =
				\ get(g:snipMate.scope_aliases, 'html', 'javascript')
	let g:snipMate.scope_aliases.php =
				\ get(g:snipMate.scope_aliases, 'php', 'php,html,javascript')
	let g:snipMate.scope_aliases.ur =
				\ get(g:snipMate.scope_aliases, 'ur', 'html,javascript')
	let g:snipMate.scope_aliases.mxml =
				\ get(g:snipMate.scope_aliases, 'mxml', 'actionscript')
	let g:snipMate.scope_aliases.eruby =
				\ get(g:snipMate.scope_aliases, 'eruby', 'eruby-rails,html')
	let g:snipMate.scope_aliases.scss =
				\ get(g:snipMate.scope_aliases, 'scss', 'css')
	let g:snipMate.scope_aliases.less =
				\ get(g:snipMate.scope_aliases, 'less', 'css')
endif

" Modified from Luc Hermitte's function on StackOverflow
" <http://stackoverflow.com/a/1534347>
function! s:grab_visual() abort
	let a_save = @a
	try
		normal! gv"ay
		let b:snipmate_visual = @a
	finally
		let @a = a_save
	endtry
endfunction

" TODO: 允许指定任意 snippet 文件
function! s:load_scopes(bang, ...) abort
	let gb = a:bang ? g: : b:
	let gb.snipMate = get(gb, 'snipMate', {})
	let gb.snipMate.scope_aliases = get(gb.snipMate, 'scope_aliases', {})
	let gb.snipMate.scope_aliases['_'] = join(split(get(gb.snipMate.scope_aliases, '_', ''), ',') + a:000, ',')
endfunction

command! -bang -bar -nargs=+ SnipMateLoadScope
			\ call s:load_scopes(<bang>0, <f-args>)

" Edit snippet files
command! SnipMateOpenSnippetFiles call snipMate#OpenSnippetFiles()

" restore(恢复/修复) 'cpo'
let &cpo = s:save_cpo
