return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  { "nvim-mini/mini.pairs", enabled = false },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false, -- Initialize directory handling before VimEnter (nvim .).
    cmd = { "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeFocus" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      disable_netrw = true,
      hijack_netrw = true,
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      view = { width = 32 },
      renderer = { group_empty = true },
      update_focused_file = { enable = true },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm", "TermExec" },
    keys = { { "<C-\\>", "<cmd>ToggleTerm<cr>", mode = { "n", "t" }, desc = "Terminal" } },
    opts = { open_mapping = [[<c-\>]], direction = "float", float_opts = { border = "rounded" } },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({ check_ts = true })
      require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end,
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      on_colors = function(c)
        c.bg = "#000000"
        c.bg_dark = "#000000"
        c.bg_float = "#000000"
        c.bg_sidebar = "#000000"
      end,
    },
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "tokyonight" } },
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.spec = vim.tbl_filter(function(m)
        return not vim.tbl_contains({ "<leader>f", "<leader>c", "<leader>w", "<leader>q" }, m[1])
      end, opts.spec or {})
      vim.list_extend(opts.spec, {
        { "<leader>l", group = "LSP" },
        { "<leader>p", group = "Plugins" },
        { "<leader>L", group = "Editor config" },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif require("luasnip").expand_or_jumpable() then
          require("luasnip").expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" })
      opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif require("luasnip").jumpable(-1) then
          require("luasnip").jump(-1)
        else
          fallback()
        end
      end, { "i", "s" })
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright", "ruff", "gopls", "goimports", "gofumpt", "jdtls",
        "rust-analyzer", "clangd", "clang-format", "vtsls", "prettier",
        "stylua", "shfmt", "debugpy", "delve", "codelldb",
        "java-debug-adapter", "java-test", "js-debug-adapter",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        rust = { "rustfmt" },
      },
    },
  },
}
