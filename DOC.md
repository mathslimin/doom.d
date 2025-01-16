### 参考资料
Emacs 笔记 (一) —— 安装与配置 Doom Emacs https://shigaro.org/2020/07/01/emacs-1/

https://www.dazhuanlan.com/cece0996/topics/1623990
[Getting started with Doom Emacs](https://medium.com/@aria_39488/getting-started-with-doom-emacs-a-great-transition-from-vim-to-emacs-9bab8e0d8458)
[Noel Welsh: Doom Emacs Workflows](https://noelwelsh.com/posts/2019-01-10-doom-emacs.html)

添加环境变量

```
 在~/.zshrc 最后一行添加export PATH=$PATH:~/.emacs.d/bin 之后就可以使用这些代码了doom help # 查看帮助doom refresh # 安装删除包
```

错误日志是~/.emacs.d/.local/doom.error.log
修改配置过后doom sync
进入emacs doom/reload
选中用ctrl+space，如果没有反应请切换英文输入法

```
display-line-numbers-mod #显示或者隐藏行号
```


# 快捷键

## 常用快捷键

| 快捷键                                                       | 说明                         |
| ------------------------------------------------------------ | ---------------------------- |
| `SPC .`                                                      | 打开文件                     |
| `SPC f r`                                                    | 打开最近打开过的文件         |
| `SPC b B`                                                    | 在所有已打开的 Buffer 中切换 |
| `u`                                                          | 撤销                         |
| `C-r`                                                        | 重做                         |
| `C-x u`                                                      | undo-tree，可视化撤销和重做  |
| `g c c`                                                      | 注释                         |
|                                                              | 代码对齐                     |
|                                                              | 80 格子                      |
| `C-x C-z`                                                    | 挂起emacs                    |
| 所以在 doom.d 的配置里面将 C-X C-Z 绑定为 suspend-emacs 这个函数 |                              |

## 工作区 Workspace

使用工作区可以保存当前项目的编辑状态，这样可以快速进入工作状态。工作区和
projectile 配合使用是非常舒服的。

从 Doom 的快捷键设计可以看出，Doom 的 workflow 基本上就是围绕着工作区展开的。

使用 `SPC TAB n` 新建工作区，建立好之后 `SPC TAB r` 对当前工作区命名，进入到工作
状态后 `SPC TAB s` 进行保存。之后就可以通过 `SPC TAB .` 来切换工作区了。同时也可
以通过 `SPC TAB 数字` 来快速切换。

当不再需要某个工作区时，可以通过 `SPC TAB d` 来删除当前工作区。

重启 emacs 后需要使用 `SPC TAB l` 来加载工作区。

工作区 1 名字为 `main` 应该留作处理一切非项目的工作，例如 `org-mode` 等。

常用的快捷键：

| 快捷键    | 说明                            |
| --------- | ------------------------------- |
| `SPC ,`   | 切换到当前项目已经打开的 buffer |
| `SPC SPC` | 切换到当前项目中的任意文件      |
| `SPC o p` | 激活trreemacs 打开本项目的文件  |
| `SPC f r` | 打开最近的文件                  |
| `SPC f f` | 打开文件                        |

## projectile

执行命令projectile-discover-projects-in-directory
自动猜，或者手动添加.projectile文件

| 快捷键    | 说明                       |
| --------- | -------------------------- |
| `SPC p p` | 切换项目                   |
| `SPC SPC` | 切换到当前项目中的任意文件 |


## 搜索

| 快捷键    | 说明                                                     |
| --------- | -------------------------------------------------------- |
| `SPC / p` | 在整个项目的所有文件中搜索                               |
| `SPC s D` | 在目录中搜索                                             |
| `/`       | 在当前 buffer 中向下搜索，使用 `n` 或者 `N` 在结果中跳转 |
| `?`       | 在当前 buffer 中向上搜索，使用 `n` 或者 `N` 在结果中跳转 |

使用 `SPC / p` 在整个项目中搜索关键字，之后可以通过 `C-c C-e` 在搜索结果中进行编
辑。编辑完成后通过 `C-c C-c` 提交，或者通过 `C-c C-k` 放弃更改。

查找替换

- for **ivy** module users #这是我们的方法
  `SPC s p foo C-c C-e :%s/foo/bar/g RET`

- for **vertico** module users
  `SPC s p foo C-; E C-c C-p :%s/foo/bar/g RET`
- https://hungyi.net/posts/doom-emacs-search-replace-project/

依赖安装ripgrep https://lindevs.com/install-ripgrep-on-ubuntu/

## 光标快速移动

例句：This is not Iris, this is Isabel
This is not Iris, this is Isabel
把光标放到这一句的开头，在 normal-state 下按下 `s` 启动 [evil-snipe](https://github.com/hlissner/evil-snipe) ( `S` 向前)，这时输入
`is` 可以将光标移动到下一个匹配 `is` 的位置，同时标注这一句话中所有的 `is` ，不
区分大小写，然后可以使用 `;/,` 向后/向前移动光标。

另外一个在可见区域内移动光标的方式是使用 [avy](https://github.com/abo-abo/avy) ，快捷键是 `g s SPC` 。按下快捷键后
输入目标文字，稍等 0.5 秒会出现对应的字母，按下对应字母就可以将光标移动过去。

这两个光标移动的方式可以极大的提高编辑速度。

另外 avy 还提供了一个 `avy-goto-char-2` 的函数，输入两个字符移动到匹配位置，也非
常好用。

无论是 evil-snipe 还是 avy 都可以使用 `v` 来快速选中，区别是 `s` 会包含定位字
符， `g s SPC` 则不会。



## 多光标

evil-multiedit 方式
使用 `v` 选中文本后，键入 `R` 可以进入多光标编辑模式，会自动选中 buffer 中其他匹
配的文本。modeline 最左边也将现实匹配的文本数量。

这时使用 `C-n` `C-p` 可以在匹配文本中轮换，按 `RET` 反选当前匹配项。选好候选项后
编辑其中一个匹配项，再按 `ESC` 退出即可应用到所有选中的匹配项。

如果不想全部选中，那么 `v` 选中文本后使用 `M-d` `M-D` 则可以向上向下一条一条的匹
配。

evil-mc 方式
那么如何在任意地方插入光标呢，使用 `g z z` 在当前位置创建光标即可。还有一些方法
如下：

| 快捷键  | 说明                                   |
| ------- | -------------------------------------- |
| `g z m` | 标记当前单词的所有匹配项               |
| `g z d` | 标记当前单词并移动到下一个匹配项       |
| `g z j` | 在当前位置创建光标，将光标移动到下一行 |
| `g z u` | 取消上一个光标，类似于 undo            |

## 快捷鍵配置

| 按鍵組        | 功用                                            | 來源   |
| :------------ | :---------------------------------------------- | :----- |
| `SPC :`       | 打開命令列                                      | doom   |
| `SPC X`       | 執行 org-catpure                                | doom   |
| `SPC Tab Tab` | 顯示 tabbar                                     | doom   |
| `SPC Tab n`   | 建立 workspace                                  | doom   |
| `SPC Tab d`   | 刪除 workspace                                  | doom   |
| `SPC Tab $n`  | 切換到第 $n 個 workspace                        | doom   |
| `SPC w s`     | 水平切割視窗                                    | doom   |
| `SPC w v`     | 垂直切割視窗                                    | doom   |
| `SPC w m`     | 最大化當前視窗                                  | doom   |
| `SPC o a r`   | 打開 org-agenda Main Repor                      | custom |
| `SPC o p`     | 打開專案 Sidebar                                | doom   |
| `SPC o P`     | 在專案 Sidebar 找檔案                           | doom   |
| `SPC o v`     | 開啟 Terminal                                   | doom   |
| `SPC o h`     | 開啟 Easy Hugo                                  | custom |
| `SPC p a`     | 新增專案                                        | doom   |
| `SPC p d`     | 移除專案                                        | doom   |
| `SPC p p`     | 切換專案                                        | doom   |
|               |                                                 |        |
| `SPC n r f`   | 開起 Roam 筆記                                  | doom   |
| `SPC n r i`   | 插入 Roam 筆記                                  | doom   |
| `SPC n r I`   | 插入 Roam 筆記 (w/ org-capture)                 | doom   |
| `SPC m e H H` | 輸出文件或單個 Subtree 到 hugo                  | doom   |
| `SPC m e H A` | 輸出文件或全部的 Subtree 到 hugo                | doom   |
| `SPC t e`     | Toogle hidding/showing of org emphasise markers | custom |
| `SPC h r r`   | 重新讀取 doom emacs 設定檔                      |        |

**使用projectile生成工程TAGS**

 从手册中看到，重新生成的方式可以通过命令

```lisp
projectile-regenerate-tags
```

**在工程管理中跳转到指定的函数或变量定义位置**

​    在Emacs的projectile工程管理模式中，如果要跳转到一个变量或者函数定义的位置，可以使用C-c pj。  

​    上面使用的方式是官方给出的一个快捷键组合方式，通过按键功能查看可以看到这个按键绑定到了projectile-find-tag函数。

跳转方法按住

```
control+]
```

`C-o` (evil-jump-backward) 跳转回ctags调用的地方 

doom-emacs 使用 vim 快捷键编辑单个文件，使用 emacs 快捷键编辑整个项目，还能使用 emacs 庞大的 elisp 插件库。

http://machbbs.com/v2ex/320902

### golang

默认 go-mode 会以`go.mod` 文件所在文件为一个项目（所以每个 go 项目必须先执行`go mod init xxx`,来创建一个项目，如果有`.git` 与 `go.mod` 同时存在会在第一次打开的时候询问以哪个项目为准，一般输入 i 就是一 go.mod 所在目录项目为准），但 gopls 会把 go-src 当作三方依赖，所以可以从我们当前代码跳到标准库代码定义中。

使用 <空格> + c 就可以唤出菜单进行对 golang symbol 语义上跳转，

比如 <空格> + c + d 会跳到 symbol 定义处， <空格> + c + D 会跳到使用 symbol 处（当然这个是我当前的版本快捷键，如果版本更新还是要看菜单显示出的快捷键）。

使用 <空格> + b 就可以唤出菜单进行进行 navigation，比如 <空格> + b + [ 就是回跳上一个页面，<空格> + b + ]就是回跳下一个页面。

使用 <空格> + s 就是全局搜索

使用 <空格> + p 就是项目管理

使用 <ctrl> + x + <ctrl> + c 就是退出 emacs

使用 <alt> + x 就是执行 emacs 三方插件提供的函数

### rust

默认 projectile 是以 git 项目作为当前一整个项目的，但 rustic 会把 rust-src 当作三方依赖，所以可以从我们当前代码跳到标准库代码定义中。

使用 <空格> + c 就可以唤出菜单进行对 rust symbol 语义上跳转，

比如 <空格> + c + d 会跳到 symbol 定义处， <空格> + c + D 会跳到使用 symbol 处（当然这个是我当前的版本快捷键，如果版本更新还是要看菜单显示出的快捷键）。

使用 <空格> + b 就可以唤出菜单进行进行 navigation，比如 <空格> + b + [ 就是回跳上一个页面，<空格> + b + ]就是回跳下一个页面。

使用 <空格> + s 就是全局搜索

使用 <空格> + p 就是项目管理

使用 <ctrl> + x + <ctrl> + c 就是退出 emacs

使用 <alt> + x 就是执行 emacs 三方插件提供的函数

### 快捷键

在 Doom Emacs 中用搜索命令简单地进行批量替换：

```lisp
SPC s p C-c C-e :%s/ROAM_TAGS/filetags/g RET Z Z
```

Workflows

### Splitting Windows

I use this a lot. I wish every application supported splitting the window like Emacs (If anyone knows a web browser that supports this I'd like to know - I do know about and use TWMs when I can).

C-x 2 [split-window-below] - Splits the window horizontally.

C-x 3 [split-window-right] - Splits the window vertically.

### Un-splitting Windows

C-x 0 [+workspace/close-window-or-workspace] - Close the selected window. If it's the last window in the workspace, either close the workspace (as well as its associated frame, if one exists) and move to the next.

C-x 1 [delete-other-windows] - Make the selected window fill its frame.

### Jumping Between Windows

Doom suprised me with this one. The keybinding is the same as the Emacs default, but it uses ace-window instead of other-window. It's great though. Just follow up with the highlighted character in the top left of the buffer to switch to that window.

C-x o [ace-window] - Select a window.

### Search For Other Occurrences in Buffer

C-s C-w [isearch-forward] - Do incremental search forward

(keep holding Ctrl and pressing w until all words you intend to search for have been selected and then go back to pressing s to search).

C-c s S [swiper-isearch-thing-at-point] - Insert symbol-at-point into the minibuffer of swiper-isearch.

### Search Project

C-c s p [+default/search-project] - Conduct a text search in the current project root

I'd also like to be able to search the entire project for the word at point, but I'm not sure if Doom supports this out of the box.

### Open Project File Explorer

C-c o p [+treemacs/toggle] - Initialize or toggle treemacs.

### Open a Terminal

C-c o t [+term/toggle] - Toggle a persistent terminal popup window.

### Text Manipulation

M-q [fill-paragraph] - Fill paragraph at or after point.

Introduces line breaks into text to keep columns as close to 80 characters as possible.

### Help

C-h k [helpful-key] - Show help for interactive command bound to KEY-SEQUENCE.

C-h v [counsel-describe-variable] - Display the full documentation of VARIABLE (a symbol).

C-h f [counsel-describe-function] - Display the full documentation of FUNCTION (a symbol).

### 从linux复制
```shell
sudo apt install xclip
cat ws_spider.py |xclip -selection clipboard
```
