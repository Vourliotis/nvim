local present, nvimtree = pcall(require, 'nvim-tree')

if not present then
  return
end

nvimtree.setup({
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  view = {
    width = 25,
    adaptive_size = true,
  },
  git = {
    enable = false,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  log = {
    enable = true,
    types = {
      diagnostics = true,
    },
  },
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
  pattern = "NvimTree_*",
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
  end
})
