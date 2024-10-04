return {
  "VonHeikemen/lsp-zero.nvim",
  event = "VimEnter",
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    {
      "j-hui/fidget.nvim",
      opts = {
        progress = {
          display = {
            done_icon = "✓",
          },
        },
        notification = {
          window = {
            winblend = 0,
          },
        },
      },
    },
  },
  config = function()
    local lsp_zero = require("lsp-zero")

    -- Define the function for attaching LSP
    local function lsp_attach(client, bufnr)
      local opts = { buffer = bufnr }

      -- Debugging: Check buffer number
      if type(bufnr) ~= "number" then
        vim.notify("Buffer number is not valid: " .. tostring(bufnr), vim.log.levels.ERROR)
        return
      end

      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>cf", function()
        vim.lsp.buf.format({ async = true })
      end, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end

    -- Setup lsp-zero
    lsp_zero.extend_lspconfig({
      sign_text = true,
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })

    -- Setup Mason
    require("mason").setup()

    -- Setup Mason LSPConfig
    require("mason-lspconfig").setup({
      ensure_installed = { "pylsp", "rust_analyzer", "gopls", "lua_ls", "tailwindcss" },
      automatic_installation = true,
      handlers = {
        function(server_name)
          local server_opts = {
            on_attach = lsp_attach,
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
          }
          require("lspconfig")[server_name].setup(server_opts)
        end,
      },
    })

    -- Setup formatters and linters
    require("mason-tool-installer").setup({
      ensure_installed = {

        -- Formatters
        "prettierd",
        "isort",
        "blackd-client",
        "marksman",
        "markdownlint-cli2",

        -- Linters
        "markdownlint-cli2",
        "gospel",
        "luacheck",
        "pylint",

        -- Debuggers
        "debugpy",
        "bash-debug-adapter",
        "delve",
      },
    })
  end,
}
