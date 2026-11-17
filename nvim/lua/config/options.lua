-- Familiar LunarVim components, with LazyVim maintaining their integration.
vim.g.lazyvim_picker = "telescope"
vim.g.lazyvim_cmp = "nvim-cmp"
vim.g.lazyvim_explorer = "neo-tree"
vim.env.PATH = "/opt/homebrew/opt/rustup/bin:" .. vim.fn.expand("~/.cargo/bin") .. ":" .. vim.env.PATH
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.timeoutlen = 300
vim.opt.relativenumber = false
