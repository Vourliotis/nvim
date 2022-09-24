local present, mason = pcall(require, 'mason')

if not present then
  return
end

mason.setup()

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
capabilities = cmp_lsp.update_capabilities(capabilities)

-- The Language Servers.
lspconfig.solargraph.setup({
  on_attach = handlers.lsp_on_attach_no_formatting,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  single_file_support = true,
  settings = { solargraph = { diagnostics = false } },
})

lspconfig.tsserver.setup({
  on_attach = handlers.lsp_on_attach_no_formatting,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  root_dir = lspconfig.util.root_pattern('package.json'),
})

lspconfig.sumneko_lua.setup({
  on_attach = handlers.lsp_on_attach,
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
  on_attach = handlers.lsp_on_attach_no_formatting,
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
  on_attach = handlers.lsp_on_attach_no_formatting,
  capabilities = capabilities,
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
})
