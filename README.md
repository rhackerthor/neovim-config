# NeoVim Config

* 此仓库包含了neovim常用的设置以及插件,将此仓库放置到`~/.config/`下,命名为`nvim`即可"开箱即用".
* **注意:将仓库复制到目标位置后,第一次启动需要科学上网,保证插件正常安装**

## 导航

[目录结构](#目录结构)
[基本设置](#基本设置)


## 目录结构

``` shell
.
├── init.lua                               # 类似main文件,nvim通过执行此文件调用lua目录中的配置及插件
├── lua                                    # lua代码目录
│   ├── config                             # 插件基本设置
│   │   ├── bufferline.lua
│   │   ├── cmp.lua
│   │   ├── lazy.lua
│   │   ├── lsp.lua
│   │   ├── lualine.lua
│   │   ├── markview.lua
│   │   ├── nvim-tree.lua
│   │   ├── nvim-treesitter.lua
│   │   └── theme.lua
│   ├── core                               # 核心配置,包括键位映射
│   │   ├── keymaps.lua
│   │   └── options.lua
│   └── plugins                            # 插件管理,列出了所有需要使用的插件
│       ├── plugin-bufferline.lua
│       ├── plugin-cmp.lua
│       ├── plugin-lsp.lua
│       ├── plugin-lualine.lua
│       ├── plugin-markview.lua
│       ├── plugin-nvim-tree.lua
│       ├── plugin-nvim-treesitter.lua
│       ├── plugin-theme.lua
│       └── plugin-vim-tmux-navigator.lua
└── README.md
```

* `init.lua`-类似main文件,nvim通过执行此文件调用lua目录中的配置及插件
* `lua/core`-核心配置,包括键位映射.
* `lua/config`-插件基本设置
* `lua/plugins`-插件管理,列出了所有需要使用的插件


## 基本设置

### 绝对行号与相对行号

* 一般可以通过`:set nu`和`:set nonu`来临时开启关闭(即关闭nvim后恢复之前的状态)绝对行号.
* 同理,可以通过`:set rnu`和`:set nornu`来临时显示关闭相对行号
* 若要保存行号设置可以在lua文件添加下面的内容

``` lua
-- lua/core/options.lua
vim.opt.relativenumber = false
vim.opt.number = true
```

### 设置缩进

* 将缩进设置为两个空格
* 开启自动缩进

``` lua
-- lua/core/options.lua
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = ture
```

### 关闭换行显示

``` lua
-- lua/core/options.lua
vim.opt.wrap = false
```

### 开启光标行强调显示

``` lua
-- lua/core/options.lua
vim.opt.cursorline = true
```

### 开启真颜色显示

* 开启改选项neovim的主题等内容才能正常显示

``` lua
-- lua/core/options.lua
opt.termguicolors = true
opt.signcolumn = "yes"
```

### 更改键位映射 

* 设置主键:根据个人习惯设置主键,通常设置为`<Space>`(空格)

``` lua
-- lua/core/keymaps.lua
vim.g.mapleader = ' '
```

* 退出插入模式:`<ESC>`按键远离键盘中间行,使用不太方便,通常设置为`jk`

``` lua
-- lua/core/keymaps.lua
vim.keymap.set("i", "jk", "ESC")
```

* 视觉模式下整行移动:在视觉模式下(normal模式下按`v`进入视觉模式)

``` lua
-- lua/core/keymaps.lua
vim.keymap.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.keymap.set("v", "K", ":m '>-2<CR>gv=gv")
```

* 快捷命令:`<leader>nh`关闭高亮显示,`<leader>w`保存更改,`<leader>q`退出nvim

``` lua
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
```


## 常用插件

### 插件管理器:lazy-plugin

[lazy.nvim](https://github.com/folke/lazy.nvim)

lazy.nvim是一个现代化的NeoVim插件管理器,主要编程语言是lua.
lazy.nvim的作者有一个开箱即用的nvim项目(和该仓库的使用方法一样)
安装前需要保证Linux环境中有`git`和`Nerd Font`字体,这里推荐使用`Source Code Pro Nerd`字体

### 主题:Tokyo Night

[Tokyo Night](https://github.com/folke/tokyonight.nvim)

该主题有四个可选的风格,配置简单,我选择该主题的主要原因是:该主题是唯一一个在我的环境下可以成功改变背景颜色的主题

### 状态栏:lualine

[lualine](https://github.com/nvim-lualine/lualine.nvim)

`lualine`是位于界面底部的状态栏,美化界面,让nvim更像IDE

### bufferline

[bufferline](https://github.com/akinsho/bufferline.nvim)

`bufferline`的功能是显示buffer到顶部,可以通过快捷键快速切换编辑页面
我设置成使用`<C-i>`和`<C-o>`向左右切换页面,并通过`<C-x>`关闭除当前页外的其他页

``` lua
vim.keymap.set("n", "<C-i>", ":BufferLineCyclePrev<CR>", opt)
vim.keymap.set("n", "<C-o>", ":BufferLineCycleNext<CR>", opt)
vim.keymap.set("n", "<C-x>", ":BufferLineCloseOthers<CR>", opt)
```

### 目录管理:nvim-tree

[nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)

目录管理是IDE的必备功能,nvim-tree提供了打开,创建,删除文件/目录的功能
常用的快捷键设置了`<leader>to`(打开目录),`<leader>tc`(关闭目录)

``` lua
keymap.set("n", "<leader>to", ":NvimTreeOpen<CR>")
keymap.set("n", "<leader>tc", ":NvimTreeClose<CR>")
```

将关闭移动到nvim-tree中可以进行以下操作:

|normal模式下输入键|动作目标        |
|:---:             |:---:           |
|a                 |创建目录/文件   |
|d                 |删除目录/文件   |
|<C-x>             |纵向分屏打开文件|
|<C-v>             |垂直分屏打开文件|

### 代码高亮:nvim-treesitter

[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

`Treesitter`可以针对不同的语言，安装不同的`language parser`, 根据需要下载

### 代码补全

[mason](https://github.com/williamboman/mason.nvim)
[nvim-cmp](https://github.com/hrsh7th/nvim-cmp/releases)

实现代码补全需要两类插件:`lsp`和`cmp`
* `lsp`是语言服务协议,可以当作代码补全的后端
* `cmp`是代码补全引擎,是代码补全的前端部分
详情可以参考下面几篇博客:
1. [mason安装](https://youngxhui.top/2023/09/neovim-beginners-guide-part-three-lsp-configuration-part-one/)
2. [cmp详解](https://www.cnblogs.com/w4ngzhen/p/17546969.html)

### vim-tmux

[vim-tmux](https://github.com/christoomey/vim-tmux-navigator)

`vim-tmux`让neovim和tmux的交互更方便
* **注意**:使用该插件不止需要修改neovim配置,还需要修改tmux的配置
