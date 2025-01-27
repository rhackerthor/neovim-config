local opt = vim.opt

-- 行号
opt.relativenumber = false
opt.number = true

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- 一行超出屏幕时,不进行换行显示
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append('a')

-- 默认新窗口在右边
opt.splitright = true
-- 默认新窗口在右边
opt.splitbelow = true

-- 搜索结果不区分大小写
opt.ignorecase = true
opt.smartcase = true

-- 开启真颜色
opt.termguicolors = true
opt.signcolumn = "yes"
