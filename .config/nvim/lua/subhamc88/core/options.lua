--== Code Editor Settings ==--
local opt = vim.opt

-- General Settings --
opt.lazyredraw = true
opt.timeoutlen = 300
opt.updatetime = 250
opt.backup = false
opt.swapfile = false
opt.undofile = true
opt.clipboard = "unnamedplus"

-- Display options --
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.fillchars = {
	eob = "•",
	vert = "|",
	horiz = "-",
	foldopen = "▶",
	foldclose = "▼",
}

-- Indenting --
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.softtabstop = 2

-- Searching --
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Mouse and Scrolling --
-- opt.mouse = "a"
-- opt.scrolloff = 8
-- opt.sidescrolloff = 8

-- Performance --
opt.hidden = true
opt.history = 1000
opt.wrap = false
opt.linebreak = true

-- File handling --
opt.autoread = true
opt.backupskip = { "/tmp/*", "/private/tmp/*" }
opt.backupskip = { "/tmp/*", "/private/tmp/*" }

-- Spell Checking --
opt.spell = true
opt.spelllang = { "en_us" }
