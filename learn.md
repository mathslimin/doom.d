sudo npm install -g typescript-language-server

sudo npm install -g typescript

ctrl+x b 跳转回文件

```bash
env | grep -i proxy
```

你可以使用 `lsp-treemacs-errors-list` 命令打开一个包含当前文件所有语法错误的列表：

```lisp
M-x lsp-treemacs-errors-list
```

关闭 Treemacs 面板：

- 你可以直接使用 `M-x treemacs-select-window` 来切换到 `treemacs` 窗口，然后按 `q` 来退出。
- 或者使用 `M-x treemacs` 来打开/关闭 `treemacs` 面板，然后按 `q` 退出。

treemacs-select-window (M-t)  切换treemacs

空格+c+d 

d → Jump to definition     
 D → Jump to references 

js2-basic-offset 

**查看缩进变量**：

可以检查`tab-width` 和 `indent-tabs-mode`变量，以了解当前的缩进设置。你可以通过 `describe-variable`命令查看这些变量的值：

- 使用 `M-x describe-variable`，然后输入 `tab-width`，按下 `Enter`。这将显示当前的缩进空格数。
- 使用 `M-x describe-variable`，然后输入 `indent-tabs-mode`，按下 `Enter`。这将显示是否使用空格（非 `nil` 表示使用空格进行缩进）。

### . 如果问题仍然存在：

- 如果在 `js2-mode` 中的缩进仍然是 2 个空格，可能是其他插件或模式覆盖了你的设置。你可以检查是否有其他配置影响了 `js2-mode` 的缩进行为。
- 另一个可能的原因是 `js2-mode` 的设置没有在文件打开时被正确加载。尝试在文件打开后手动设置缩进：

```
emacs
M-x set-variable RET js2-basic-offset RET 4
```

把 vim ./.emacs.d/.local/straight/repos/js2-mode/js2-mode.el里面的(* 2 js2-basic-offset))) 改为(* 4 js2-basic-offset)))

### 方法 5：通过 `C-Space` 代替 `C-@`

在 Emacs 中，`Ctrl+@` 和 `Ctrl+Space` 是等价的，都可以用于设置标记（mark）。因此，你可以直接使用 `Ctrl+Space` 来代替 `Ctrl+Shift+@`。

1. 在 Emacs 中按下 `Ctrl+Space` 设置标记。
2. 移动光标以选择区域。

1. 打开 MobaXterm，点击菜单栏的 **Settings** -> **Configuration**。
2. 在 **Terminal** 选项卡中，找到 **Terminal color scheme**。
3. 选择一个与 DOOM Emacs 主题匹配的配色方案，例如：
   - 如果使用 `doom-one` 主题，选择 **One Dark**。
   - 如果使用 `doom-dracula` 主题，选择 **Dracula**。
   - 如果使用 `doom-nord` 主题，选择 **Nord**。

emacs 多行添加空格

#### 添加空格到多行开头：

1. 将光标移动到你想开始的第一行。
2. 按 `C-SPC` 来设置区域的开始位置。
3. 使用上下方向键移动光标到区域的最后一行，选中你想添加空格的所有行。
4. 按 `M-x`，然后输入 `indent-rigidly`，按回车。
5. 输入你要添加的空格数量，按回车，空格将被添加到选定的所有行开头。

mobaxterm emacs 颜色不支持, Put this in the .bashrc file:

```shell
export TERM=xterm-256color
```

