require('persisted').setup({
  save_dir = vim.fn.expand(vim.fn.stdpath('data') .. '/sessions/'),
  command = 'VimLeavePre',
  use_git_branch = true,
  autosave = false,
  autoload = false,
  allowed_dirs = nil,
  ignored_dirs = nil,
  before_save = nil,
  after_save = function()
    print("Session was saved!")
  end,
  after_source = function(session)
    print("Loaded session " .. session.name)
  end,
  telescope = {
    before_source = function()
      -- Close all open buffers
      -- Thanks to https://github.com/avently
      vim.api.nvim_input("<ESC>:%bd<CR>")
    end,
    after_source = function(session)
      print("Loaded session " .. session.name)
    end,
  },
})
