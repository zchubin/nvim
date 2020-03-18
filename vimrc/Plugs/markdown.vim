"===
"=== markdown_preview vim-markdown-quote-syntax
"===

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 1
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit'                : {},
    \ 'katex'               : {},
    \ 'uml'                 : {},
    \ 'maid'                : {},
    \ 'disable_sync_scroll' : 0,
    \ 'sync_scroll_type'    : 'middle',
    \ 'hide_yaml_meta'      : 1,
    \ 'sequence_diagrams'   : {},
    \ 'flowchart_diagrams'  : {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let vim_markdown_preview_hotkey='<C-m>'

" =============================================
function! g:Open_firefox_in_new_window(url)
    silent exe 'silent !open -na "Firefox" --args --new-window ' . a:url
endfunction

let g:mkdp_browserfunc='g:Open_firefox_in_new_window'

if !exists('g:markdown_quote_syntax_defaults')
  let g:markdown_quote_syntax_defaults = {
	\ "vim" : {
	\   "start" : "vim",
	\},
	\ "diff" : {
	\   "start" : "diff",
	\},
	\ "c" : {
	\   "start" : "c",
	\},
	\ "cpp" : {
	\   "start" : "cpp",
	\},
	\ "java" : {
	\   "start" : "java",
	\},
	\ "ruby" : {
	\   "start" : "\\%(ruby\\|rb\\)",
	\},
	\ "haskell" : {
	\   "start" : "\\%(haskell\\|hs\\)",
	\},
	\ "python" : {
	\   "start" : "\\%(python\\|py\\)",
	\},
	\ "perl" : {
	\   "start" : "\\%(perl\\|pl\\)",
	\},
	\ "javascript" : {
	\   "start" : "\\%(javascript\\|js\\)",
	\},
	\ "html" : {
	\   "start" : "html",
	\},
	\ "sh" : {
	\   "start" : "sh",
	\},
	\ "sql" : {
	\   "start" : "sql",
	\},
	\ "ocaml" : {
	\   "start" : "ocaml",
	\},
	\ "erlang" : {
	\   "start" : "erlang",
	\},
  \}
endif

if !exists('g:markdown_quote_syntax_filetypes')
  let g:markdown_quote_syntax_filetypes = {}
endif

if !exists('g:markdown_quote_syntax_codeblocks_default')
  " Triple backtick, Triple wave, Liquid highlight,
  " Octopress codeblock (w/ and w/o lang:)
  "
  " Each codeblock is defined as:
  "  'codeblock[0].filetype.codeblock[1]<code lines>codeblock[2]'
  let g:markdown_quote_syntax_codeblocks_default = [
    \["^\\s*\\(>\\s*\\)\\?```", "\\(\\s*:.*\\)\\?$",
      \"^\\s*\\(>\\s*\\)\\?```\\ze\\s*$"],
    \["^\\s*\\~\\{3,}\.*\\.", ".*$","^\\s*\\~\\{3,}\\ze\\s*$"],
    \["^\\s*{% *highlight \\+", "\\( .*%\\|%\\)}", "^\\s*{% *endhighlight\\( .*%\\|%\\)}"],
    \["^\\s*{% *codeblock \\( *\\|.* \\)lang:", "\\( .*%\\|%\\)}", "^\\s*{% *endcodeblock\\( .*%\\|%\\)}"],
    \["^\\s*{% *codeblock \\(.*lang:.*\\)\\@!.*\\.", "\\( *%\\| .*%\\)}", "^\\s*{% *endcodeblock\\( .*%\\|%\\)}"],
  \]
endif

if !exists('g:markdown_quote_syntax_codeblocks')
  let g:markdown_quote_syntax_codeblocks = []
endif

if !exists('g:markdown_quote_syntax_on_filetypes_default')
  let g:markdown_quote_syntax_on_filetypes_default = ['markdown', 'mkd']
endif

if !exists('g:markdown_quote_syntax_on_filetypes')
  let g:markdown_quote_syntax_on_filetypes = []
endif

augroup markdown_quote_syntax
  autocmd!
  let on_filetypes = deepcopy(g:markdown_quote_syntax_on_filetypes_default)
  let on_filetypes = extend(on_filetypes, g:markdown_quote_syntax_on_filetypes)
  for ft in on_filetypes
    execute "autocmd Syntax" ft "call markdown_quote_syntax#enable_quote_syntax()"
  endfor
augroup END

let g:loaded_markdown_quote_syntax = 1
