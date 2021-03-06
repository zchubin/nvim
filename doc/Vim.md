# Vim 命令
[回到 README](../README.md)
----

![VimKeys](./vi-vim-cheat-sheet-sch.gif)
## 关于 Vim
Vim 是我最喜欢的编辑器，也是 Linux 下最强的编辑器之一。如果初学 vi, 查看 tutor 和 help 文档是个明智的决定。

* 被`<>`包围时键盘上的键，
- eg:
    - \<a\>表示按一下`a`键，
    - \<A\>表示按下`shift`+`a`
    - 3\<a\>表示按`3`+`a`
* 被`[]`包围表示可选项

### vim 的模式
1. 普通模式：可以使用快捷键命令，按<ESC>键进入
    - 命令模式：在普通模式下，按`:`键进入
2. 插入模式：可以输入文本，按 a、A、i、I、s、S、c、C、o、O 键进入
3. 可视化模式：文本选择，按 v、V 键进入
4. 替换模式：文本替换，按 r、r 键进入

### 用 Vim 编辑文件
1. shel 下：
```shell
vim file          # 用 vim 编辑指定文件
vim -c cmd file   # 在打开文件前，限制性指定的命令
vim -r file       # 恢复上次一场退出的文件
vim -R file       # 只读方式打开文件，可强制保存
vim -M file       # 只读方式打开文件，不能强制保存
vim -y num file   # 将编辑窗口的大小设为 num 行
vim + file        # 文件的末尾开始
vim +/string file # 打开 file, 并将光标停留在第一个 string 字符上
vim -remote file  # 用已有的 vim 打开指定文件，避免打开多个 vim 进程
```

2. vim 下：
```vim
:e file             " 关闭当前文件，并打开新文件，如果为保存当前文件，vi 会提出警告并询问
:e! file            " 放弃修改，关闭当前文件，并打开新文件
:e+ file            " 开始新文件，并从文件结尾开始编辑
:e+n file           " 开始新文件，并从文件第 n 行开始编辑
:e                  " 重新加载当前文件
:e!                 " 重新加载当前文件，并丢弃当前修改
:e#或<C-^>          " 回到刚才编辑的文件

:f filename         " 改变编辑的文件名，相当于另存为
:saveas newfilename " 另存为

<gf>                " 打开光标所在字符串为文件的名的文件

:w                  " 保存
:n1,n2w filename    " 选则性保存从 n1 到 n2 行的文件，并命名 filename
:q                  " 退出，如做修改 vi 会警告，提示保存
:q!                 " 强制退出
:q[uit]             " 退出当前窗口 (<C-w>q 或<C-w><C-q>)
:wq                 " 保存 + 退出
<ZZ>                " 保存 + 退出
:x                  " 保存 + 退出

:browse e           " 打开文件浏览器选则你需要编辑的文件

:Sex                " 水平分割，浏览文件系统
:Vex                " 垂直分割，浏览文件系统
```

### 光标移动
* \<h\>或、<BS\>: 左移一个字符
* \<l\>或、<CR\>: 右移一个字符
* \<j\>: 下移一个字符
* \<k\>: 上移一个字符

* \<gj\>: 移动到一段内的下一行
* \<gk\>: 移动到一段内的上一行

* \<+\>或、<CR\>: 把光标移至下一行第一个非空字符
* \<-\>: 把光标移至上一行第一个非空字符

* \<w\>: 移动下一个单词开头，光标停留在单词第一个字符
* \<W\>: 移动下一个单词开头，忽略标点符号，光标停留在单词第一个字符
* \<e\>: 移动下一个单词结尾，光标停留在单词最后一个字符
* \<E\>: 移动下一个单词结尾，忽略标点符号，光标停留在单词最后一个字符

* \<b\>: 移动上一个单词开头，光标停留在单词第一个字符
* \<B\>: 移动上一个单词开头，忽略标点符号，光标停留在单词第一个字符
* \<ge\>: 移动上一个单词结尾，光标停留在单词最后一个字符
* \<gE\>: 移动上一个单词结尾，忽略标点符号，光标停留在单词最后一个字符

* \<(\>: 前一句，光标停留在段落的第一句
* \<)\>: 后一句，光标停留在段落的第一句
* \<{\>: 前一段，光标停留在段落之间
* \<}\>: 后一句，光标停留在段落之间

* \<f\>: 在光标所在行向后查找，光标提留在查找的字符上
* \<F\>: 在光标所在行向前查找，光标提留在查找的字符上
* \<t\>: 在光标所在行向后查找，光标提留在查找的字符前
* \<t\>: 在光标所在行向前查找，光标提留在查找的字符前
* \<;\>: 重复一次，配合<f>&<t>使用
* \<,\>: 反向重复一次，配合<f>&<t>使用

* \<0\>: 移动到行首
* \<$\>: 移动到行尾
* \<^\>或、<g^\>: 移动到当前行第一个非空字符
* \<g0\>: 移动到光标所在屏幕行行首
* \<g$\>: 移动到光标所在屏幕行行尾
* n\<|\>: 移动到第 n 列
* n\<G\>: 移动到第 n 行
```vim
:n<CR> "移动到第 n 行
:$<CR> "移动到最后一行
```
* \<H\>: 把光标移到屏幕最顶端
* \<M\>: 把光标移动到屏幕中间
* \<L\>: 把光标移动到屏幕底端
* \<gg\>: 文件开头
* \<G\>: 文件结尾

### 翻屏
* \<C-f\>: 下翻一屏
* \<C-b\>: 上翻一屏
* \<C-d\>: 下翻半屏
* \<C-u\>: 上翻半屏
* \<C-e\>: 下翻一行
* \<C-y\>: 上翻一行
* n\<%\>: 到文件 n% 的位置
* \<zt\>: 当前行移动到垂直顶端
* \<zz\>: 当前行移动到垂直居中
* \<zb\>: 当前行移动到垂直底端

### 标记
> 标记可是实现快速跳转，可以使用 **\<C-i\>和、<C-o\>实现前进和后退**

* \<m\>[a-z]: 新建标记，标记只用于当前文件，重启丢失
* \<m\>[A-Z]: 新建标记，标记用于全局标记，重启不丢失

* \<\`\>[a-z]: 跳转对应标记位置
* \<\'\>[a-z]: 跳转对应标记行首

* \<\`\>[0-9]: 跳转对上次关闭前修改过的位置，最多记录 [2-10] 次
* \<\`\`\>: 跳转上次修改的位置
* \<''\>: 跳转上次修改的位置行首
* \<\`\"\>: 跳转上次离开的位置
* \<\`\.\>: 跳转上次修改的位置
```vim
:marks          " 显示所有标记
:delmarks a b   " 删除标记a和b
:delmarks a-c   " 删除标记a到c(a、b 和c)
:delmarks a c-f " 删除标记a和c到f(a、c、d、e和f)
:delmarks!      " 删除缓冲区所有标记

:h mark-motions "查看详细解释——推荐查阅
```

### 写入模式
* \<i\>:在光标前插入
    - 技巧:插入分割线`++++++++++++++++++++++++++++++`——键位:`30<i>+<ESC>`
* \<I\>:行首非空字符插入
* \<a\>:在光标后插入
* \<A\>:行尾插入
* \<o\>:在光标所在行上新建一行
* \<O\>:在光标所在行下新建一行
```vim
:r filename "在当位置插入另一份文件的内容
:[n]r filename "在第n行插入一份文件的内容

:r !date "在当前行插入时间日期
:r !command "可以将其它shell命令的输出当作输入加载进文件
```

* \<c\>[n]\<w\>:改写光标后1(n)个词
* \<c\>[n]\<l\>:改写光标后1(n)个字符
* [n]\<cc\>:修改当前n行
* \<C\>:修改当前光标到行尾
* [n]\<s\>:用输入的文本代替光标后1(n)个字符
* [n]\<S\>:用输入的文本代替光标指定1(n)行
