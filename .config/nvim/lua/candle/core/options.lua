vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.inccommand = "split"
opt.relativenumber = true
opt.number = true
opt.conceallevel = 1
opt.showtabline = 2

-- fold
opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- turn off swapfile
opt.swapfile = false
opt.backup = false

-- undodir
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- column
opt.colorcolumn = "80"
