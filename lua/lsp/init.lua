local mason_presence, mason = pcall(require, 'mason')
local mason_lspconfig_presence, mason_lspconfig = pcall(require, 'mason-lspconfig')

if not mason_presence or not mason_lspconfig_presence then
  return
end

mason.setup()
mason_lspconfig.setup({
  -- Whether servers that are set up (via lspconfig) should be automatically installed
  automatic_installation = { exclude = { 'gopls' } },
})

-- Diagnostics floating window
require('lsp.configs.diagnostics')

local lspconfig = require('lspconfig')
local cmp_lsp = require('cmp_nvim_lsp')
local handlers = require('lsp.handlers')
local lsp = vim.lsp

-- Global handlers.
lsp.handlers['textDocument/hover'] = handlers.hover
lsp.handlers['textDocument/signatureHelp'] = handlers.signature_help

-- The nvim-cmp completion plugin supports most LSP capabilities.
-- We notify the language servers about that.
local capabilities = lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.default_capabilities(capabilities)

-- The Language Servers.
lspconfig.solargraph.setup({
  on_attach = handlers.on_attach_no_formatting,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  single_file_support = true,
  settings = { solargraph = { diagnostics = false } },
})

lspconfig.tsserver.setup({
  on_attach = handlers.on_attach_no_formatting,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  root_dir = lspconfig.util.root_pattern('package.json'),
})

lspconfig.sumneko_lua.setup({
  on_attach = handlers.on_attach_no_formatting,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
})

lspconfig.gopls.setup({
  on_attach = handlers.on_attach_no_formatting,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  cmd = { 'gopls', 'serve' },
  filetypes = { 'go', 'gomod' },
  root_dir = lspconfig.util.root_pattern('go.work', 'go.mod', '.git'),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})

lspconfig.emmet_ls.setup({
  on_attach = handlers.on_attach_no_formatting,
  capabilities = capabilities,
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'eruby' },
})

lspconfig.cssls.setup({
  on_attach = handlers.on_attach,
  capabilities = capabilities,
})

lspconfig.html.setup({
  on_attach = handlers.on_attach,
  capabilities = capabilities,
  filetypes = { 'html', 'eruby' },
})
