-- LunarVim's main mappings. Space is the leader key.
-- Remove LazyVim prefixes that conflict with LunarVim's single-key actions.
for _, m in ipairs(vim.api.nvim_get_keymap("n")) do
  local lhs = m.lhs:gsub("<Space>", " ")
  if lhs:match("^ [fcqw]") or lhs == " l" then
    pcall(vim.keymap.del, "n", m.lhs)
  end
end
local function map(lhs, rhs, desc, mode)
  vim.keymap.set(mode or "n", lhs, rhs, { silent = true, desc = desc, nowait = true })
end
local function telescope(name, opts)
  return function() require("telescope.builtin")[name](opts or {}) end
end
local function dap(name)
  return function() require("dap")[name]() end
end
local function git(name, opts)
  return function() require("gitsigns")[name](opts) end
end
map("<leader>;", "<cmd>Alpha<cr>", "Dashboard")
map("<leader>w", "<cmd>write<cr>", "Save")
map("<leader>q", "<cmd>confirm quit<cr>", "Quit")
map("<leader>c", function() Snacks.bufdelete() end, "Close Buffer")
map("<leader>f", telescope("find_files", { hidden = true, previewer = false }), "Find File")
map("<leader>h", "<cmd>nohlsearch<cr>", "Clear Search Highlight")
map("<leader>e", "<cmd>NvimTreeToggle<cr>", "Explorer")
map("<leader>/", "gcc", "Comment Line", "n")
vim.keymap.set("n", "<leader>/", "gcc", { remap = true, silent = true, desc = "Comment Line" })
vim.keymap.set("x", "<leader>/", "gc", { remap = true, silent = true, desc = "Comment Selection" })
map("<S-l>", "<cmd>bnext<cr>", "Next Buffer")
map("<S-h>", "<cmd>bprevious<cr>", "Previous Buffer")
map("<leader>bj", "<cmd>BufferLinePick<cr>", "Pick Buffer")
map("<leader>bf", telescope("buffers", { previewer = false }), "Find Buffer")
map("<leader>bb", "<cmd>bprevious<cr>", "Previous Buffer")
map("<leader>bn", "<cmd>bnext<cr>", "Next Buffer")
map("<leader>bW", "<cmd>noautocmd write<cr>", "Save Without Formatting")
map("<leader>be", "<cmd>BufferLinePickClose<cr>", "Pick Buffer to Close")
map("<leader>bh", "<cmd>BufferLineCloseLeft<cr>", "Close Buffers to Left")
map("<leader>bl", "<cmd>BufferLineCloseRight<cr>", "Close Buffers to Right")
map("<leader>bD", "<cmd>BufferLineSortByDirectory<cr>", "Sort by Directory")
map("<leader>bL", "<cmd>BufferLineSortByExtension<cr>", "Sort by Language")
for key, action in pairs({ t = "toggle_breakpoint", b = "step_back", c = "continue", C = "run_to_cursor", d = "disconnect", i = "step_into", o = "step_over", u = "step_out", p = "pause", r = "repl", s = "continue", q = "close" }) do
  if action ~= "repl" then map("<leader>d" .. key, dap(action), "Debug " .. action:gsub("_", " ")) end
end
map("<leader>dr", function() require("dap").repl.toggle() end, "Debug REPL")
map("<leader>dg", function() vim.print(require("dap").session()) end, "Debug Session")
map("<leader>dU", function() require("dapui").toggle({ reset = true }) end, "Debug UI")
for key, action in pairs({ i = "install", s = "sync", S = "show", c = "clean", u = "update", p = "profile", l = "log", d = "debug" }) do
  map("<leader>p" .. key, "<cmd>Lazy " .. action .. "<cr>", "Plugins " .. action)
end
map("<leader>gg", function() Snacks.lazygit() end, "Lazygit")
map("<leader>gj", function() require("gitsigns").nav_hunk("next") end, "Next Hunk")
map("<leader>gk", function() require("gitsigns").nav_hunk("prev") end, "Previous Hunk")
for key, action in pairs({ l = "blame_line", L = "blame_line", p = "preview_hunk", r = "reset_hunk", R = "reset_buffer", s = "stage_hunk", u = "undo_stage_hunk" }) do
  map("<leader>g" .. key, git(action, key == "L" and { full = true } or nil), "Git " .. action:gsub("_", " "))
end
map("<leader>go", telescope("git_status"), "Changed Files")
map("<leader>gb", telescope("git_branches"), "Git Branches")
map("<leader>gc", telescope("git_commits"), "Git Commits")
map("<leader>gC", telescope("git_bcommits"), "Buffer Commits")
map("<leader>gd", function() require("gitsigns").diffthis("HEAD") end, "Git Diff")
map("<leader>la", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
map("<leader>ld", telescope("diagnostics", { bufnr = 0 }), "Buffer Diagnostics")
map("<leader>lw", telescope("diagnostics"), "Workspace Diagnostics")
map("<leader>lf", function() LazyVim.format({ force = true }) end, "Format", { "n", "x" })
map("<leader>li", "<cmd>checkhealth vim.lsp<cr>", "LSP Info")
map("<leader>lI", "<cmd>Mason<cr>", "Language Tools")
map("<leader>lj", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next Diagnostic")
map("<leader>lk", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Previous Diagnostic")
map("<leader>ll", vim.lsp.codelens.run, "CodeLens")
map("<leader>lq", vim.diagnostic.setloclist, "Diagnostics List")
map("<leader>lr", vim.lsp.buf.rename, "Rename Symbol")
map("<leader>ls", telescope("lsp_document_symbols"), "Document Symbols")
map("<leader>lS", telescope("lsp_dynamic_workspace_symbols"), "Workspace Symbols")
map("<leader>le", telescope("quickfix"), "Quickfix")
for key, action in pairs({ b = "git_branches", c = "colorscheme", f = "find_files", h = "help_tags", H = "highlights", M = "man_pages", r = "oldfiles", R = "registers", t = "live_grep", k = "keymaps", C = "commands", l = "resume" }) do
  map("<leader>s" .. key, telescope(action), "Search " .. action:gsub("_", " "))
end
map("<leader>sp", telescope("colorscheme", { enable_preview = true }), "Preview Theme")
map("<leader>Lc", function() vim.cmd.edit(vim.fn.stdpath("config") .. "/lua/plugins/lunar.lua") end, "Edit Config")
map("<leader>Lf", telescope("find_files", { cwd = vim.fn.stdpath("config") }), "Find Config File")
map("<leader>Lg", telescope("live_grep", { cwd = vim.fn.stdpath("config") }), "Search Config")
map("<leader>Lk", telescope("keymaps"), "All Keymaps")
map("<leader>Lu", "<cmd>Lazy update<cr>", "Update Plugins")
map("<leader>tf", "<cmd>ToggleTerm direction=float<cr>", "Floating Terminal")
map("<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", "Horizontal Terminal")
map("<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<cr>", "Vertical Terminal")
