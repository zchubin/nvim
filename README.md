# init.vim
This is Neovim configuration on **windows10** for a new recruit.

## Installation

Note: init.vim requires Neovim(0.5.0+) with Python3. See
[requires](href="## requires")
requires if you aren't sure whethre you have this.

You can use `git clone https://github.com/zchubin/nvim-Z.git`
to get it.

## Requirements
This configuration requires Neovim with if_pyhthon3.
if `echo has("Python3")` returns `1` ,then you're done; othrewis, see
below.

You can enable Python3 interface with pip:

```pip
pip3 install --user pynvim
```

If you want to read the pynvim/python3 interface install
documentation, you should read `:help provider-python` and the Wiki.

### Note: Python3 must be enable before updating remote Plugins

## About The Configuration

### Mapkeys

| key       | used                              |
|-----------|-----------------------------------|
| '<Space>' | '<Leader>'                        |
| ';f'      | '<ESC>/<++><CR>:nohlsearh<CR>c4l' |
| '''       | '''<++><ESC>5ha'                  |
| '"'       | '""<++><ESC>5ha'                  |
| '('       | '()<++><ESC>5ha'                  |
| '['       | '[]<++><ESC>5ha'                  |
| '{'       | '{}<++><ESC>5ha'                  |

