"=************************************************************************************************
"=* ┌───┐   ┌───┬───┬───┬───┐ ┌───┬───┬───┬───┐ ┌───┬───┬───┬───┐ ┌───┬───┬───┐                  *
"=* │Esc│   │ F1│ F2│ F3│ F4│ │ F5│ F6│ F7│ F8│ │ F9│F10│F11│F12│ │P/S│S L│P/B│  ┌┐    ┌┐    ┌┐  *
"=* └───┘   └───┴───┴───┴───┘ └───┴───┴───┴───┘ └───┴───┴───┴───┘ └───┴───┴───┘  └┘    └┘    └┘  * 
"=*┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───────┐ ┌───┬───┬───┐ ┌───┬───┬───┬───┐ *
"=*│~ `│! 1│@ 2│# 3│$ 4│% 5│^ 6│& 7│* 8│( 9│) 0│_ -│+ =│ BacSp │ │Ins│Hom│PUp│ │N L│ / │ * │ - │ *
"=*├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─────┤ ├───┼───┼───┤ ├───┼───┼───┼───┤ *
"=*│ Tab │ Q │ W │ E │ R │ T │ Y │ U │ I │ O │ P │{ [│} ]│ | \ │ │Del│End│PDn│ │ 7 │ 8 │ 9 │   │ *
"=*├─────┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴─────┤ └───┴───┴───┘ ├───┼───┼───┤ + │ *
"=*│ Caps │ A │ S │ D │ F │ G │ H │ J │ K │ L │: ;│" '│ Enter  │               │ 4 │ 5 │ 6 │   │ * 
"=*├──────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────────┤     ┌───┐     ├───┼───┼───┼───┤ *
"=*│ Shift  │ Z │ X │ C │ V │ B │ N │ M │< ,│> .│? /│  Shift   │     │ ↑ │     │ 1 │ 2 │ 3 │   │ *
"=*├─────┬──┴─┬─┴──┬┴───┴───┴───┴───┴───┴──┬┴───┼───┴┬────┬────┤ ┌───┼───┼───┐ ├───┴───┼───┤ E││ *
"=*│ Ctrl│    │Alt │         Space         │ Alt│    │    │Ctrl│ │ ← │ ↓ │ → │ │   0   │ . │←─┘│ *
"=*└─────┴────┴────┴───────────────────────┴────┴────┴────┴────┘ └───┴───┴───┘ └───────┴───┴───┘ *
"=************************************************************************************************

"=====================================
"=== Auto load for first time uses ===
"=====================================

if empty(glob('~/.config/vim/autoload/plug.vim'))
silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"====================
"=== Bash Setting ===
"====================

"Clear vi
set nocompatible

syntax on
syntax enable
" (***)
" [***]
" {***}
set showmatch

set magic

set nu
set relativenumber

set mouse=a
set mousemodel=popup

set cursorline
set showmode
set showcmd

set backspace=indent,eol,start
set whichwrap+=<,>,h,l
"sm = smartident
set smarttab

"fo = formatoptions
set fo+=mB

"A word include +=_,$,@,%,#,-
set iskeyword+=_,$,@,%,#,-

"At split for read
set fillchars=vert:\ ,stl:\ ,stlnc:\

"00x 10 scaloe
set nrformats=

set indentexpr=

"font-size=18
"linux
"set guifont=Monaco\\ 18
"windows
set guifont=Monaco:18

set encoding =utf-8
set fileencoding=utf-8
language messages zh_CN.utf-8
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,big5,euc-jp,euc-kr,latin1
let &termencoding=&encoding

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

:let g:ft_ignnore_pat = '\.\(z\|'
set completeopt=longest,menu
set formatoptions=tcrqn

"Automatic indetation
set autoindent
"tw = tapwidth
set tw=0
"sw = shifrwidth
set sw=4
"ts = tapstop
set ts=4

set expandtab
"C indetation
set cindent

"Automatic folding
set wrap
set lbr
set foldmethod=indent
set foldlevel=99
"When (*),[*],{*} to folding
set wrapmargin=2
"Vertical scroll
"The distance Up/Down position

set scrolloff=8
"Horizontally scroll
"The distance Left/Righr position
set sidescrolloff=15

"======================
"=== Vim Status bar ===
"======================

set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2
set ruler
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set viminfo='10,\"100,:20,%,n~/.viminfo

"==============
"=== Search ===
"==============

"Highlingt the match results
set hlsearch
"Aautomatically jumps to First match result
set incsearch
"Ignore "A" or "a"
set ignorecase
"If only "A" will "senstive"
set smartcase

"==============
"=== Editor ===
"==============

set undofile
set history=100

set nobackup
set noswapfile

"Visualize special component charcacters
set list
set listchars=tab:▸\ ,trail:▫
set wildmenu
set wildmode=longest:list,full

"Spell check
"set spell spelllang=en_us
"Automatically switch working directories
set autochdir
"Don't alarm,screen display
set noerrorbells
set visualbell
"Open the file monitor
"If an edit is changed by another
"prompt
set autoread

"====================
"=== Cursor style ===
"====================

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" __  ____   __  _   ___     _____ __  __ ____   ____  "
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___| "
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |     "
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___  "
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____| "
"                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O<Tab>

inoremap --- <++>

let mapleader=" "
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
noremap <LEADER><CR> :nohlsearch<CR>

"ctr-a/c/z/s
inoremap <C-a> <ESC>mmggVG
vmap <C-c> "*y<ESC>'mA
inoremap <C-z> <ESC>ui
inoremap <C-s> <ESC>:w<CR>A

noremap <C-n> :tabe<CR>
"" Move around tabs with tn and ti
noremap tb :-tabnext<CR>
noremap tn :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmb :-tabmove<CR>
noremap tmn :+tabmove<CR>

noremap tk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap tj :set splitbelow<CR>:split<CR>
noremap th :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap tl :set splitright<CR>:vsplit<CR>

noremap <LWADER><up> :res +5<CR>
noremap <LWADER><down> :res -5<CR>
noremap <LWADER><left> :vertical resize-5<CR>
noremap <LWADER><right> :vertical resize+5<CR>

"===================
"=== specialized ===
"===================

"source ~/.vim/snippits.vim
"source ~/.vim/markdown.vim
"source ~/.vim/map.vim

"                     _
"             __   __(_)_ __ ___
"        _____\ \ / /| | '_ ` _ \
"       |_____|\ V / | | | | | | |
"               \_/  |_|_| |_| |_|
