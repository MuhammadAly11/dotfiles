-- set some neovim options
--

vim.g.mapleader = " "

-- set numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- modify openning new windows
vim.opt.splitbelow = true
vim.opt.splitright = true

-- always put the curser line in the middel
vim.opt.scrolloff = 10

-- visual block mode beyond the end of the line
vim.opt.virtualedit = "block"

-- set tab to 4 spaces
vim.opt.shiftwidth = 4

-- split preview
vim.opt.inccommand = "split"

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- save undo history
vim.opt.undofile = true

-- for indentation
vim.opt.smartindent = true

-- 
--
