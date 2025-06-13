vim.g.mapleader = " "
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true

-- indent with spaces instead of tabs
vim.opt.expandtab = true

-- Define the width of a tab character (as displayed)
vim.opt.tabstop = 4

-- set the number of spaces tab and backspace inserts
vim.opt.softtabstop = 4

-- set the number of spaces that are inserted when pressing SHIFT + >
vim.opt.shiftwidth = 4

-- FORMAT ON SAVE
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format()
	end
})

-- LAZY.NVIM

-- install-path for lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- load plugins from the plugins folder
require("lazy").setup({
    {import = "plugins"},
    {import = "plugins/themes"}
})

