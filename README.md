
| key               | mapkyes                            |
|-------------------|------------------------------------|
| '`<LEADER>`'      | '`<SPACE>`'                        |
| '`<LEADER><CR>`'  | '`:nolsearch<CR>`'                 |
| '`<LEADER><DEL>`' | '`<ESC>lc5l`'                      |
| '`<leader>fd`'    | '`/\(\<\w\+\)\_s*\1`'              |
| '`<leader>W`'     | '`:call DeleteTrailingWS()<CR>`'   |

**imap**

| key          | mapkeys                                                |
|--------------|--------------------------------------------------------|
| ';f'         | '<ESC>/<++><CR>:nohlsearh<CR>c4l'                      |
| ';q'         | '`<ESC>`'                                              |
| '''          | '''<++><ESC>5ha'                                       |
| '"'          | '""<++><ESC>5ha'                                       |
| '('          | '()<++><ESC>5ha'                                       |
| '['          | '[]<++><ESC>5ha'                                       |
| '{'          | '{}<++><ESC>5ha'                                       |
| '"='         | '"===<CR>===<SPACE><CR>===<CR><ESC>0C<CR><++><ESC>3kA' |

**vmap**

| key | mapkeys |
|-----|---------|
| 'y' | '`"*y`' |

**nmap**

| key           | mapkeys                                             |
|---------------|-----------------------------------------------------|
| '`<C-D>`'     | '`:table`'                                          |
| 'tb'          | '`:-tablenext<CR>`'                                 |
| 'tn'          | '`:+tablenext<CR>`'                                 |
| 'tmb'         | '`-tabmove<CR>`'                                    |
| 'tmn'         | '`+tabmove<CR>`'                                    |
| 'tk'          | '`nosplitbelow<CR>:split<CR>:set splitbelow<CR>`'   |
| 'tj'          | '`splitbelow<CR>:split<CR>`'                        |
| 'th'          | '`nosplitright<CR>:vsplit<CR>:set splitright<CR>`'  |
| 'tl'          | '`splitright<CR>:vsplit<CR>`'                       |

and
```vim
noremap `<up> :res +5<CR>
noremap `<down> :res -5<CR>
noremap `<left> :vertical resize-5<CR>
noremap `<right> :vertical resize+5<CR>
```

### Plug
- [1] 'rakr/vim-one'
- [2] 'vim-ailine/vim-airline'
- [3] 'vim-aiine/vim-airline-themes'
- [4] 'preservim/nerdtree'
- [5] 'vim-scripts/vim-cursorword'
- [6] 'mattn/emment-vim'
- [7] 'othree/html5.vim'
- [8] 'cakebaker/scss-syntax.vim'
- [10] 'ccampbell/rainbow'
- [1] 'gko/vim-coloresque'
- [1] 'preservim/nerdcommenter'
- [1] 'dense-analysis/ale'
- [1] 'iamcco/markdown-preview.vim'
