# Neovim Configuration

[Documentation](https://neovim.io/doc)

* This is a Neovim configuration for ~~newbies~~ mainly on **Windows10**.
    - 这是一个新手主要在 windows10 上的 Neovim 配置。
* I have limited expressive power,but your understanding is outstanding
    - 你的理解能力肯定比我的写得好。
* Please don't download **without reading this document**.
    - 请不要只下载而不读本文档。

```txt
************************************************************************************************
* ┌───┐   ┌───┬───┬───┬───┐ ┌───┬───┬───┬───┐ ┌───┬───┬───┬───┐ ┌───┬───┬───┐                  *
* │Esc│   │ F1│ F2│ F3│ F4│ │ F5│ F6│ F7│ F8│ │ F9│F10│F11│F12│ │P/S│S L│P/B│  ┌┐    ┌┐    ┌┐  *
* └───┘   └───┴───┴───┴───┘ └───┴───┴───┴───┘ └───┴───┴───┴───┘ └───┴───┴───┘  └┘    └┘    └┘  *
*┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───────┐ ┌───┬───┬───┐ ┌───┬───┬───┬───┐ *
*│~ `│! 1│@ 2│# 3│$ 4│% 5│^ 6│& 7│* 8│( 9│) 0│_ -│+ =│ BacSp │ │Ins│Hom│PUp│ │N L│ / │ * │ - │ *
*├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─────┤ ├───┼───┼───┤ ├───┼───┼───┼───┤ *
*│ Tab │ Q │ W │ E │ R │ T │ Y │ U │ I │ O │ P │{ [│} ]│ | \ │ │Del│End│PDn│ │ 7 │ 8 │ 9 │   │ *
*├─────┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴─────┤ └───┴───┴───┘ ├───┼───┼───┤ + │ *
*│ Caps │ A │ S │ D │ F │ G │ H │ J │ K │ L │: ;│" '│ Enter  │               │ 4 │ 5 │ 6 │   │ *
*├──────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────────┤     ┌───┐     ├───┼───┼───┼───┤ *
*│ Shift  │ Z │ X │ C │ V │ B │ N │ M │< ,│> .│? /│  Shift   │     │ ↑ │     │ 1 │ 2 │ 3 │   │ *
*├─────┬──┴─┬─┴──┬┴───┴───┴───┴───┴───┴──┬┴───┼───┴┬────┬────┤ ┌───┼───┼───┐ ├───┴───┼───┤ E││ *
*│ Ctrl│    │Alt │         Space         │ Alt│    │    │Ctrl│ │ ← │ ↓ │ → │ │   0   │ . │←─┘│ *
*└─────┴────┴────┴───────────────────────┴────┴────┴────┴────┘ └───┴───┴───┘ └───────┴───┴───┘ *
************************************************************************************************
```
* The above is my keyboard layout
    - 以上是我的键盘布局

## Installation

* You can use `git` to get it.( 你可使用 git 来下载配置。 )
```shell
cd ~\Desktop\

git clone https://github.com/zchubin/nvim.git
```

* If you don't have git, you can find the corresponding version of your system from [here](https://gitforwindows.org).
    - 如果你没有 git，你可从 [这里](https://gitforwindows.org) 你系统对应的版本


* Note:  See [Requires](##Requirements), if you aren't sure whethre you have this.
    - 注意：参看[需求列表](##Requirements), 如果你不确定你是否已安装。

## Requirements

    - [ ] Python3
    - [ ] Ruby
    - [ ] Nodejs
    - [ ] Perl

```shell
# Python
# 国内下载
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple pynvim
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple neovim
# or 官网下载
pip3 install pynvim
pip3 install neovim

# Nodejs
npm config set registry https://registry.npm.taobao.org # 修改国内源
npm install -g neovim

# Ruby
gem sources --remove https://rubygems.org/
gem sources -a http://gems.ruby-china.com/
gem sources --add https://ruby.taobao.org/ # 改用国内源

gem install minitest-neovim # 修复了使用 neovim 的终端在 vim-dispatch-neovim 中运行 minitest 测试
cmd /c gem list -ra ^^neovim$ # 查看是否安装成功
```

* You can use `: checkhealth` to see if your Neovim configuration is still problematic.
    - 你可以使用`:checkhealth`来查看你的 Neovim 配置是否还有问题。

## Options

* It can be better for your editor when you install `./need/font`.
    - 安装`./need`里的字体文件，它不是必须但它可以使你的 (Neo)vim 更“好看”。

## About The Configuration

### 1. Plugin manager:vim-Plug 插件管理器
`:PlugStatus`  来查看当前你的插件状态，
`:PlugClean`   来清理注释 ( 无用 ) 的插件，
`:PlugInstall` 来安装插件，
`:PlugUpgrad`  来升级你的插件，
`:PlugUpdate`  来升级你的插件。

### 2. Main Keymaps 主快捷键

**About <LEADER>**

| key             | mapkyes                        |
| :---:           | :---                           |
| `<LEADER>`      | `<SPACE>`                      |
| `<LEADER><CR>`  | `:nolsearch<CR>`               |
| `<LEADER><DEL>` | `<ESC>lc5l`                    |
| `<LEADER>fw`    | `/\(\<\w\+\)\_s*\1`            |
| `<LEADER>fd`    | `:e $MYVIMRC<CR>`              |
| `<LEADER>w`     | `:call DeleteTrailingWS()<CR>` |
| `<lEADER>q`     | `:q<CR>`                       |
| `<lEADER>Q`     | `:q!<CR>`                      |
| `<lEADER>rr`    | `:call CompileRunGcc()<CR>`    |

**imap**

| key    | mapkeys                           |
| :---:  | :---                              |
| ;f     | `<ESC>/<++><CR>:nohlsearh<CR>c4l` |
| ;q     | `<ESC>`                           |
| \<C-s> | `<ESC>ma:w<CR>'a`                 |

*Installed plugin, no longer needed*
    - 以下快捷键被插件取代了
| key | mapkeys                                              |
| --- | ---                                                  |
| '   | ''<++><ESC>5ha                                       |
| "   | ""<++><ESC>5ha                                       |
| (   | ()<++><ESC>5ha                                       |
| [   | []<++><ESC>5ha                                       |
| {   | {}<++><ESC>5ha                                       |
| "=  | "===<CR>===<SPACE><CR>===<CR><ESC>0C<CR><++><ESC>3kA |

**vmap**

| key   | mapkeys |
| :---: | :---:   |
| y     | `"*y`   |

**nmap**

| key        | mapkeys                                                            |
| :---:      | :---                                                               |
| tu         | `:table`                                                           |
| tb         | `:-tablenext<CR>`                                                  |
| tn         | `:+tablenext<CR>`                                                  |
| tmb        | `-tabmove<CR>`                                                     |
| tmn        | `+tabmove<CR>`                                                     |
| tk         | `nosplitbelow<CR>:split<CR>:set splitbelow<CR>`                    |
| tj         | `splitbelow<CR>:split<CR>`                                         |
| th         | `nosplitright<CR>:vsplit<CR>:set splitright<CR>`                   |
| tl         | `splitright<CR>:vsplit<CR>`                                        |
| th         | `<C-w>t<C-w>K`                                                     |
| tv         | `<C-w>t<C-w>H`                                                     |
| sh         | `<C-w>t<C-w>K`                                                     |
| sv         | `<C-w>t<C-w>H`                                                     |
| srh        | `<C-w>b<C-w>K`                                                     |
| srv        | `<C-w>b<C-w>H`                                                     |
| \`\<UP>    | `:res +5<CR>`                                                      |
| \`\<DOWN>  | `:res -5<CR>`                                                      |
| \`\<LEFT>  | ` :vertical resize-5<CR>`                                          |
| \`\<RIGHT> | `:vertical resize+5<CR>`                                           |
| \`\<ESC>   | `:set nonumber<CR>:set norelativenumber<CR>:set signcolumn=no<CR>` |
| \`\<TAB>   | `:set signcolumn=no<CR>`                                           |
| \`\<CR>    | `:set signcolumn=yes<CR>`                                          |
| \`0        | `:set relativenumber<CR>`                                          |
| \`1        | `:set nonumber!<CR>:set foldcolumn=0<CR>`                          |
| \`9        | `:<C-u>call <SID>toggle_background()<CR>`                          |
| `<C-s>`    | `<ESC>ma:w<CR>'a`                                                  |

**Command**

* Allow typos
    - 允许输入错误

| input command | out command |
| :---:         | :---:       |
| qw            | wq          |
| Wq            | wq          |
| WQ            | wq          |
| Qa            | qa          |
| Bd            | bd          |
| bD            | bd          |

**在不切换输入法时输入一些与英文差异较大的中文符号**

| key          | mapkeys |
| :---:        | :---:   |
| `<LEADER>\\` | `、`    |
| `<LEADER>..` | `。`    |
| `<LEADER>--` | `——`    |

### 3. Plugin 插件

#### 3.1 Exterior (外观) -- Not necessary

> No Keymaps -- 以下插件没有映射快捷键

| Function                    | Plugin                           |
| :---:                       | ---                              |
| 向 vim 提供文件类型标志符号 | 'ryanoasis/vim-devicons'         |
| 为 (N)vim 更改开始屏幕      | 'mhinz/vim-startify'             |
| 状态栏                      | 'vim-airline/vim-airline'        |
|                             | 'vim-airline/vim-airline-themes' |
| 用彩色突出显示括号方阵      | 'ccampbell/rainbow'              |
| 显示缩进线                  | 'Yggdroot/indentLine'            |
| 给关键字添加下划线          | 'vim-scripts/vim-cursorword'     |
| 中文排版                    | 'hotoo/pangu.vim'                |

> 显示复制范围:'machakann/vim-highlightedyank'被`Coc-yank`取代

#### 3.2 Commonly Used (常用插件)

| Function         | Plugin                         |
| :---:            | ---                            |
| 自动匹配括号     | 'jiangmiao/auto-pairs'         |
| 快速对齐对       | 'godlygeek/tabular'            |
| 拼写检查         | 'dense-analysis/ale'           |
| 快速添加包围符号 | 'tpope/vim-surround'           |
| 模糊查找工具     | 'Yggdroot/LeaderF'             |
| 快速注释         | 'preservim/nerdcommenter'      |
| 多项选择修改     | 'terryma/vim-multiple-cursors' |
| 按键提示         | 'liuchengxu/vim-which-key'     |

#### 3.3 NERDTree

* 'preservim/nerdtree'
* 'Xuyuanp/nerdtree-git-plugin'

#### 3.4 Programming language 编程语言

* Html,css
    'mattn/emmet-vim'
    'othree/html5.vim'
    'cakebaker/scss-syntax.vim'
    'gko/vim-coloresque'

* python
    'tmhedberg/SimpylFold'
    'Vimjas/vim-python-pep8-indent'

* markdown
    'iamcco/markdown-preview.nvim'

* git
    'airblade/vim-gitgutter'

#### 3.5 coc.nvim 补全框架

* 'neoclide/coc.nvim'

