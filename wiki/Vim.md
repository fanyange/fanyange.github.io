---
title: Vim
---

* TOC
{:toc}

- Plugins
  - [[Emmet]]

执行-重复-回退

`.`范式: 一键移动，一键执行

repeat examples:

- `:normal` for normal command
- `@:` for Ex command
- `&` for substitute

## Normal Mode

算数运算： `<C-a> and <C-x>`

`set nrformats=`

operator + motion

operator: `c`, `d`, `y`, `g~`, `gu`, `gU`, `<`, `=`, `!`

operate on a line: `gUU`

Operator-Pending mode

快速回到刚才位置：<C-O>

`:h map-operator`

## Insert mode
`<C-r>{register}`

`<C-r><C-p>{register}`

插入模式下快速执行普通模式命令: <C-O>{operation}

### 表达式寄存器

`<C-r>={expression}<CR>`

### 字符编码查询/插入

查询：`ga` 插入：`<C-v>{code}`

### 二合字母

`<C-k>{char1}{char2}`

### 替换模式 R

`R{operations}` 虚拟替换模式 `gR`

## Visual mode

### Select mode
`<C-g>`

`v`, `V`, `<C-v>`, **`gv`**

切换活动端：`o`

### 列可视模式
`<C-v>r|`
`<S-v>r-`

可打破方形区域(`$`)

`I`, `A` 和 `i`, `a` 在可视模式中的约定

## Command mode
• Ex commands
> ed -> em(editor for mortals) -> en -> ex -> vi -> Vim

### 位置
`:$`
`:60d`
`:{start},{end}`
`:.,$p`
`:%p`
`:'<,'>`
`:/<html>/+1,/<\/html>/-1`

`1`, `$`, `0`, `.`, '`m`, '`<`, '`>`, `%`

### 复制和移动行
`:copy` or `:t` (不覆盖寄存器)

`:move`

### 指定范围上执行普通模式命令

`:normal` (光标会移到该行起始处)

Ex: `@:` =~ Operations: `.`
`@:` => `@@`
`<C-O>`

### 补全
`<C-d>`

bash-like: `set wildmode=longest,list`
zsh-like:

    set wildmenu
    set wildmode=full
    
把当前单词插入到命令行:
`:<C-r><C-w>`
`:<C-r><C-a>`

### 命令行窗口
`q:`
`<CR>`

`q/`
`q:`
`<C-F>`

### 运行 Shell 命令
`:shell`

`:r !{cmd}`

#### range!（过滤器）
外部命令过滤缓冲区内容：
`:[range]!{filter}`

example: `:2,$!sort -t',' -k2`

预置范围：`!{motion}`

## Manage mutiple files

### buffers
`ls`(`#` and `%` before a list item)
• `<C-^>` vs. `<C-6>`

`bnext`, `bprev`, `bfirst`, `blast`

`buffer N` and `buffer {bufname}`

do Ex comamnd on all buffers: `bufdo`

=> unimpaired.vim(`]b`, `[B`, `]t`, ...)

`bdelete N1, N2, N3`
`N, M bdelete`

### args
`:args arg1 arg2`
Glob: `:args **/*.js`

:args `ls .`

- buffers LIKE desktop
- args LIKE workspace

### 隐藏缓冲区

`edit!`
`qa[ll]!`
`wa[ll]!`

`set hidden`

### Split
`<C-w>s:edit {file}`
or
`:split {file}`

`:clo[se]` = `<C-w>c`
`:on[ly]` = `<C-w>o`

### resize window
`<C-w>=`
`<C-w>_`
`<C-w>|`
`[N]<C-w>`
`[N]<C-w>`

http://vimcasts.org/episodes/working-with-windows/

### Tabpage
A container with windows

`:lcd {path}` and `:windo lcd {path}`

http://vimcasts.org/e/9

`lcd` vs `cd`

Create a new tab: `:tabedit {filename}`
If there are more than one window: `<C-w>T`

### swatches between tabs
`{N}gt`, `{N}gT`


## Opening and saving file

### edit
`edit %:h<Tab>{filename}`

<--! use %% to represent the current file path -->
`cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'`

`set path+=app/**`

`find Main.js`

### netrw
`j`, `k`, `<CR>` and `-`
`:E[xplore]`
`:Ve` and `:Se`

### if edit a nonexist directory
`:!mkdir -p %%` && `:write`

`:w !sudo tee > /dev/null %`

## Motion
实际行与屏幕行:
- `j`, `k` and `gj`, `gk`
- 包括 `0`, `$`, `^`, `_`

- `w` and `b`
- `e` and `ge`

`ea` and `gea`

开区间删除
`d/ge<CR>`

### text objects
`a)` = `ab`
`i}` = `aB`
`is`, `ip`

> 忍者的"单足飞踹"和"剪刀腿"

### block object and non-block object
block: `i}` ...
non-block: `iw` ...

### mark positions
`m{a-zA-z}` local or global

```shell
`` 跳转之前(<C-O>)
`. 上次修改
`^ 上次插入
`[ 上次修改/复制起始处
`] 上次修改/复制末端
`< 上次高亮起始处
`> 上次高亮末端
```

## Jumps
`<C-O>` and `<C-i>`

### `:jumps`(跳转列表)
every window

- `edit {newfile}` `<C-o>`
- `[count]G`
- `()`
- `{}`
- `H/M/L`
- `gf`
- `<C-]>`
- `'{mark}` and ``{mark}` 

> breadcrumb trail

每个单独的窗口都有一份自己的跳转列表

`<Tab>` is `<C-i>`

### `:changes`(改变列表)
every buffer
`g;`, `g,`

•`gi`

### go to file
`:set suffixesadd+=.rb`

`:vimgrep /pattern/ **`

## Register
`"{register}`

黑洞寄存器(`h quote_`): `"_d{motion}`

`:delete c`
`:reg "c`

- 无名寄存器(`h quote_quote`): `""`
- 复制专用寄存器: `"0`
- lowercase:(overlap register) / uppercase(append register)
- 系统剪贴板(`"+`)
- 选择专用寄存器(`"*`)
- 表达式寄存器(`"=`)
- 只读寄存器(`:h quote.`): `"%`, `"#`, `".`, `":` , `"/`

### Use visual mode to paste a register
I like chips and fish.


### linewise-register
`gp` and `gP`

## Macro

### 串行 vs. 并行
串行： 安全捕获机制
并行： `:normal @a`

### Append
`qA`

### Iterator
`:let i=0`
`echo i`
`...`
`:let i+=1`

`:put` 总会粘贴至本行下方

`:let @a=substitute(@a, '\~', 'vU', 'g')`

## Pattern
`set ignorecase`
`set smartcase`
`\c` and `\C`

### very magic mode
very magic and very nomagic:
`\v` and `\V`

magic and nomagic:
`\m` and `\M`

`\_s`

### 零宽度元字符
`<>`
`%(And|D)rew`

### 界定查找边界：
search and match
`\zs` and `\ze`

like 环视断言 of Perl(`:h perl-patterns`)

### escape
`=escape(@u, getcmdtype().'\')`

### end
`/vim/e`

## Find
`set nowrapscan`
`n`, `N` and `/<CR>`, `?<CR>`

回溯： `<UP>`, `<Down>`

优雅禁用hls: `:nohls`

自动补全查找域: `<C-r><C-w>`

统计匹配个数： `%s///gn`

### 查找偏移
`//e<CR>` 充其量是一次 move
`gU//e<CR>`

Plugin: textobj-lastpat

### 迭代模式匹配/查找/替换
`c%(<C-r>")<ESC>`





## ctags
http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html

`<C-]>`, `g<C-]>`

`:pop`, `<C-t>` vs `:tag`

`:tselect`, `:tag {keyword}`, `:tjump {keyword}`

`:tjump /phone$`

## Quickfix
`:make[!]` (jump or no)

`:cnfile`, `:cpfile`, `:cc N`, `:copen`, `:cclose`

• location list:
`:lmake`, `:lgrep`, `:lvimgrep`

`:colder` and `:cnewer`

`:setglobal errorformat`

scanf: `%f`, `%l`, `%m:`

`:compiler`

## Autocompletion
`<C-p>` and `<C-n>`; `<UP>` and `<Down>`

Details:

- `<C-x><C-n>`(this buffer)
- `<C-x><C-i>`(including file)
- `<C-x><C-l>`(whole line)
- `<C-x><C-f>`(filename)
- `<C-x><C-O>`(全能)

`<C-y>`(ensure), `<C-e>`(cancel)

## Spell
`:set spell`
`[s`,  `]s`

`z=`
`zg` and `zw`, or `zug`

`:set spelllang`(current buffer)

`<C-x><C-s>` or `<C-x>s`


---------------------------------



显示当前文件名
--------------

`ctrl g`

sudo 保存
---------

`:w !sudo tee %`

光标移动
--------

`w`, `e`, `b`, `e`, `w`, `b`; `hjkl`; `0`,`$`,`^`



翻页
----

`c-b`, `c-f`

卷屏
----

`zt`, `zz`, `zb`

删除
----

`d` `dt` `df`

撤销
----

`u` ,`u` ,`crtl-r`

复制、粘贴
----------

`y`, `yy` == `0y$`

移动行
------

`:m+(x)`: 下移 x 行

`:m-(x+1)`: 上移 x 行

标记
----

`mx:<var>` `'x`

定位
----

`gg`, `shift-g`

`f`, `t`

搜索
----

- `/` 和 `?`: 下查/上查

- `n` 和 `n`: 往下/往上继续搜索

跳转
----

- `g_`: 跳转到本行最后一个非空字符

- `gd`: 跳转到函数声明

- `gd`: 跳转到全域函数声明

- `%` : 括号等成对字符切换

- `#` 和 `*`: 找到上一个/下一个相同单词

替换
----

`:s/[old]/[new]/` : 行内单个替换

`:s/[old]/[new]/g` : 行内全局替换

`:== ,#s/old]/[new]/g` : 指定行内替换

`:%s/[old]/[new]/g[c]`:
全文全局替换，带"c"结尾则强制所有替换操作需要一一确认

- 单字替换

  `r` 

- 向后替换

  `r`

- 大小写替换

  `gu`: 大写； `gu`: 小写

- 大小写替换（当前字母): `~`

可视模式
--------

`v ctrl-v`(块可视模式)

搜索参数
--------

`ic`: 忽略大小写

`hls: 高亮搜索

`is`: 实时切换到搜索匹配项

切换缓冲区
----------

`:bn`: 下一个

`:bp`: 上一个

分屏
----

- 分屏打开文件：

  `vim -o[n] file1 file2`:  垂直 

  `vim -o[n] file1 file2`:  水平 

` 其中，"n"参数表示打开的屏幕数`

- 打开分屏：

  - 上下分屏

  `ctrl-w s` 

  `:sp filename` 

  - 左右分屏

  `ctrl-w v` 

  `:vsp filename` 

- 移动光标:

  `ctrl-w [hjkl]` 

- 移动分屏：

  `ctrl-w [hjkl]` 

宏录制
------

录制以 "q" 开始 "a" 作为寄存器名，再次键入 "q" 结束录制

`qa<content>q`

`@a` 会调用宏 "a"，`@@` 会调用最近录制的宏

递归操作示例： `100@@`

reload .vimrc
-------------

`:so % " you'are editing it` `:so $myvimrc`

accsess system clipboard
------------------------

- copy: `"+y`
- paste: `"+gp`
- paste: `:put +`
