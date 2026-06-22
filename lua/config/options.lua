-- Sensible Neovim Options
local opt = vim.opt

-- Line Numbers
opt.number = true
opt.relativenumber = true

-- Tabs & Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Search Behavior
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Visuals & Window Styling
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8

-- System clipboard integration
opt.clipboard:append("unnamedplus")

-- Split behavior
opt.splitbelow = true
opt.splitright = true

-- Performance / Miscellaneous
opt.updatetime = 250
opt.timeoutlen = 300
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- Mouse support
opt.mouse = "a"
