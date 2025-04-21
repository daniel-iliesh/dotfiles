vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.expandtab = false     -- Use real tabs for indentation
vim.opt.tabstop = 4           -- Tabs are 4 spaces wide
vim.opt.shiftwidth = 4        -- Indentation level is 4 spaces (or a tab)
vim.opt.softtabstop = 4       -- Makes backspacing behave like 4 spaces
vim.opt.smarttab = true       -- Smart handling of tabs in indentation
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- My shit
vim.opt.showcmd = true

vim.opt.list = true
vim.opt.listchars = {
    tab = "»·",      -- Show tabs as "»·" (You can customize this)
    -- space = "·",     -- Show spaces as "·"
    trail = "•",     -- Show trailing spaces as "•"
    extends = "›",   -- Show when text extends beyond the screen
    precedes = "‹",  -- Show when there's text before the screen
}
