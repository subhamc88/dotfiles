--== Keymaps ==--
local map = vim.keymap.set

--== Code Editor ==--

-- Clear Search Hightlight --
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })

-- Window --
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

--== Navigation ==--

-- Oil --
map("n", "\\", "<CMD>Oil<CR>", { desc = "File manager as buffer" })

-- Telescope --
map("n", "<leader>sl", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>sb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>sh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ss", "<cmd>Telescope spell_suggest<CR>", { desc = "telescope spell suggest" })
map("n", "<leader>sm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>sk", "<cmd>Telescope keymaps<CR>", { desc = "telescope find marks" })
map("n", "<leader>so", "<cmd>Telescope builtin<CR>", { desc = "telescope search options" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>sf", "<cmd>Telescope find_files hidden=true<cr>", { desc = "telescope find files" })

-- Undo Tree --
map("n", "<leader>u", "<CMD>UndotreeToggle<CR>", { desc = "Version Control without Git" })

--== Formatting ==--

-- Conform --
map({ "n", "v" }, "<leader>fc", function()
  require("conform").format {
    lsp_fallback = true,
    aync = false,
    timeout_ms = 500,
  }
end, { desc = "Code Formatting" })

--== Linting ==--

-- nvim-lint --
map("n", "<leader>l", function()
  require("lint").try_lint()
end, { desc = "Toggle lint" })

--== Diagnostics ==--

-- nvim-dap --
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>")
map("n", "<leader>dc", "<cmd>DapContinue<CR>")
map("n", "<leader>dus", function()
  local widgets = require "dap.io.widgets"
  local sidebar = widgets.sidebar(widgets.scope)
  sidebar.open()
end)
