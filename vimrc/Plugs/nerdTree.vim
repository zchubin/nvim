"===
"=== NERDTree
"===

map tt :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
let NERDTreeWinSize=25

" 打开vim打开nerdtree
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" 更改默认箭头
let g:NERDTreeDirArrowExpandable  = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" 如果唯一打开的窗口是NERDTree,如何关闭vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : "☒",
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1

let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeSyntaxEnabledExtensions = [
    \ 'html', 'css', 'scss', 'js',
    \ 'java', 'php', 'rb',
    \ 'json', 'vim',
    \ 'c', 'h', 'lock', 'md', 'pug', 'vue',
    \ 'png', 'jpg', 'svg', 'icon'
    \ ]
let g:NERDTreeHighlightCursorline = 0

let s:brown       = "905532"
let s:aqua        = "3AFFDB"
let s:blue        = "689FB6"
let s:pastelblue  = "81a1c1"
let s:lightblue   = "88c0d0"
let s:darkBlue    = "44788E"
let s:purple      = "834F79"
let s:lightPurple = "834F79"
let s:red         = "AE403F"
let s:beige       = "F5C06F"
let s:yellow      = "F09F17"
let s:orange      = "D4843E"
let s:darkOrange  = "F16529"
let s:pink        = "CB6F6F"
let s:salmon      = "EE6E73"
let s:green       = "8FAA54"
let s:lightGreen  = "31B53E"
let s:white       = "FFFFFF"

let g:NERDTreeExtensionHighlightColor={}
let g:NERDTreeExtensionHighlightColor['html']=s:pastelblue
let g:NERDTreeExtensionHighlightColor['css']=s:blue
let g:NERDTreeExtensionHighlightColor['scss']=s:blue
let g:NERDTreeExtensionHighlightColor['js']=s:yellow

let g:NERDTreeExtensionHighlightColor['java']=s:purple
let g:NERDTreeExtensionHighlightColor['php']=s:purple
let g:NERDTreeExtensionHighlightColor['rb']=s:purple

let g:NERDTreeExtensionHighlightColor['json']=s:orange
let g:NERDTreeExtensionHighlightColor['vim']=s:orange

let g:NERDTreeExtensionHighlightColor['c']=s:blue
let g:NERDTreeExtensionHighlightColor['h']=s:blue
let g:NERDTreeExtensionHighlightColor['lock']=s:red
let g:NERDTreeExtensionHighlightColor['md']=s:lightGreen
let g:NERDTreeExtensionHighlightColor['pug']=s:lightGreen
let g:NERDTreeExtensionHighlightColor['vue']=s:green

let g:NERDTreeExtensionHighlightColor['png']=s:lightblue
let g:NERDTreeExtensionHighlightColor['PNG']=s:lightblue
let g:NERDTreeExtensionHighlightColor['jpg']=s:lightblue
let g:NERDTreeExtensionHighlightColor['svg']=s:orange
let g:NERDTreeExtensionHighlightColor['icon']=s:salmon

let s:rspec_red   = 'FE405F'
let s:git_orange  = 'F54D27'

let g:NERDTreeExactMatchHighlightColor={}
let g:NERDTreeExactMatchHighlightColor['node_modules/']=s:lightblue

let g:NERDTreeExactMatchHighlightColor={}
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange

let g:NERDTreePatternMatchHighlightColor = {}
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red
