# init.vim
This is Neovim configuration on **windows10** for a new recruit.

## Installation

Note: init.vim requires Neovim(0.5.0+) with Python3. See
[requires](##requires)
requires if you aren't sure whethre you have this.

You can use `git clone https://github.com/zchubin/nvim.git`
to get it.

## Requirements
This configuration requires Neovim with if_pyhthon3.
if `echo has("Python3")` returns `1` ,then you're done; othrewis, see
below.

You can enable Python3 interface with pip:

```shell
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pynvim

```

If you want to read the pynvim/python3 interface install
documentation, you should read `:help provider-python` and the Wiki.

### Note: Python3 must be enable before updating remote Plugins

## About The Configuration

### Mapkeys
**<leader> map**

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

| key   | mapkeys                                            |
|-------|----------------------------------------------------|
| 'tu'  | '`:table`'                                         |
| 'tb'  | '`:-tablenext<CR>`'                                |
| 'tn'  | '`:+tablenext<CR>`'                                |
| 'tmb' | '`-tabmove<CR>`'                                   |
| 'tmn' | '`+tabmove<CR>`'                                   |
| 'tk'  | '`nosplitbelow<CR>:split<CR>:set splitbelow<CR>`'  |
| 'tj'  | '`splitbelow<CR>:split<CR>`'                       |
| 'th'  | '`nosplitright<CR>:vsplit<CR>:set splitright<CR>`' |
| 'tl'  | '`splitright<CR>:vsplit<CR>`'                      |
| 'th'  | '`<C-w>t<C-w>K`'                                   |
| 'tv'  | '`<C-w>t<C-w>H`'                                   |

and
```vim
noremap `<up> :res +5<CR>
noremap `<down> :res -5<CR>
noremap `<left> :vertical resize-5<CR>
noremap `<right> :vertical resize+5<CR>
```
