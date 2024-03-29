local g = vim.g
local opt = vim.opt
local fn = vim.fn

g.mapleader = " "

g.border_style = "rounded"
g.markdown_fenced_languages = {
  "bash=sh",
}

g["vim_search_pulse_mode"] = 'pattern'

opt.backup         = false                           -- creates a backup file
opt.clipboard      = ""                              -- don't use clipboard
opt.cmdheight      = 1                               -- more space in the neovim command line for displaying messages
opt.colorcolumn    = "99999"                         -- fixes indentline for now
opt.completeopt    = { "menuone", "noselect" }
opt.conceallevel   = 0                               -- so that `` is visible in markdown files
opt.cursorline     = true                            -- highlight the current line
opt.expandtab      = true                            -- convert tabs to spaces
opt.fileencoding   = "utf-8"                         -- the encoding written to a file
opt.foldexpr       = ""                              -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
opt.foldmethod     = "manual"                        -- folding set to "expr" for treesitter based folding
opt.hidden         = true                            -- required to keep multiple buffers and open multiple buffers
opt.hlsearch       = false                           -- highlight all matches on previous search pattern
opt.ignorecase     = true                            -- ignore case in search patterns
opt.laststatus     = 2                               -- hide statusline
opt.listchars      = "tab:│ ,trail:·,nbsp:+"
opt.list           = true
-- opt.mouse       = "nv"
opt.number         = true                            -- set numbered lines
opt.numberwidth    = 1                               -- set number column width to 2 {default 4}
opt.pumheight      = 10                              -- pop up menu height
opt.relativenumber = false                           -- set relative numbered lines
opt.scrolloff      = 4                               -- is one of my fav
opt.shiftwidth     = 2                               -- the number of spaces inserted for each indentation
opt.showmode       = false                           -- we don't need to see things like -- INSERT -- anymore
opt.showtabline    = 2                               -- always show tabs
opt.sidescrolloff  = 4
opt.signcolumn     = "yes"                           -- always show the sign column otherwise it would shift the text each time
opt.smartcase      = true                            -- smart case
opt.smartindent    = true                            -- make indenting smarter again
opt.spell          = false                           -- disable spell checking
opt.spelllang      = "en"                            -- language for spell checking
opt.splitbelow     = true                            -- force all horizontal splits to go below current window
opt.splitright     = true                            -- force all vertical splits to go to the right of current window
opt.swapfile       = false                           -- creates a swapfile
opt.tabstop        = 2                               -- insert 2 spaces for a tab
opt.termguicolors  = true                            -- set term gui colors (most terminals support this)
opt.timeoutlen     = 500                             -- timeout length
opt.titlestring    = "%<%F - nvim"                   -- what the title of the window will be set to
opt.title          = true                            -- set the title of window to the value of the titlestring
opt.undodir        = fn.stdpath("cache") .. "/undo"
opt.undofile       = true                            -- enable persistent undo
opt.updatetime     = 300                             -- faster completion
opt.wrap           = true                            -- display lines as one long line
opt.writebackup    = false                           -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
