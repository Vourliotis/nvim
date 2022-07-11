local present, lsp_installer = pcall(require, 'nvim-lsp-installer')

if not present then
  return
end

-- Diagnostics floating window
require('lsp.configs.diagnostics')

local options = {
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = ' ',
      server_pending = ' ',
      server_uninstalled = ' ﮊ',
    },
    keymaps = {
      toggle_server_expand = '<CR>',
      install_server = 'i',
      update_server = 'u',
      check_server_version = 'c',
      update_all_servers = 'U',
      check_outdated_servers = 'C',
      uninstall_server = 'X',
    },
  },

  max_concurrent_installers = 10,
}

lsp_installer.setup(options)

local nvim_lsp = require('lspconfig')
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
nvim_lsp.solargraph.setup({
  on_attach = handlers.lsp_on_attach_no_formatting,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  single_file_support = true,
  settings = { solargraph = { diagnostics = false } },
})

nvim_lsp.tsserver.setup({
  on_attach = handlers.lsp_on_attach_no_formatting,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  root_dir = nvim_lsp.util.root_pattern('package.json'),
})

nvim_lsp.sumneko_lua.setup({
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

nvim_lsp.gopls.setup({
  on_attach = handlers.lsp_on_attach_no_formatting,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  cmd = { 'gopls', 'serve' },
  filetypes = { 'go', 'gomod' },
  root_dir = nvim_lsp.util.root_pattern('go.work', 'go.mod', '.git'),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})

nvim_lsp.emmet_ls.setup({
    on_attach = handlers.lsp_on_attach_no_formatting,
    capabilities = capabilities,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
})
