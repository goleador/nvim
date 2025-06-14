local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Optional: keymaps for LSP
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
end

-- 🐍 Python (pyright)
lspconfig.pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- 🍎 Swift (sourcekit-lsp via Xcode)
lspconfig.sourcekit.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { "xcrun", "sourcekit-lsp" }, -- 🛠 Xcode CLI command for Swift LSP
}

-- ☕ Java (jdtls – basic setup)
lspconfig.jdtls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- 🟨 JavaScript & TypeScript (tsserver)
lspconfig.ts_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- 🌙 Lua (for Neovim development)
lspconfig.lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
}


