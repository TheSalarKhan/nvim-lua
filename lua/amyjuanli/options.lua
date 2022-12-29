-- vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'

local opt = vim.opt
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

vim.wo.number = true -- show window line numbers

opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.hlsearch = false
opt.incsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 10
opt.shell = 'zsh'
opt.backupskip = { '/tmp/*', '/private/tmp/*' }
opt.inccommand = 'split'
opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
opt.smarttab = true
opt.breakindent = true
opt.linebreak = true -- Stop words being broken on wrap
opt.shiftwidth = 2
opt.tabstop = 2
opt.wrap = true
opt.backspace = { 'start', 'eol', 'indent' }
opt.path:append { '**' } -- Finding files - Search down into subfolders
opt.wildignore:append { '*/node_modules/*' }
opt.mouse = 'a' -- Allow the use of mouse

-- Color
opt.cursorline = true
opt.termguicolors = true
opt.winblend = 0
opt.wildoptions = 'pum'
opt.pumblend = 5
opt.background = 'dark'

-- Undercurl
-- vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
opt.formatoptions:append { 'r' }

opt.clipboard:append { 'unnamedplus' }

-- netrw options
vim.g.netrw_banner = 1
-- vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 75
vim.g.netrw_list_style = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_preview = 1
