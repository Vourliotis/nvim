local success, persisted = pcall(require, 'persisted')

if not success then
  return
end

persisted.setup({
  use_git_branch = true,
  autosave = false,
  after_save = function()
    print('Session saved!')
  end,
  after_source = function(session)
    print('Loaded session ' .. session.name)
  end,
  telescope = {
    before_source = function()
      -- Close all open buffers
      -- Thanks to https://github.com/avently
      vim.api.nvim_input('<ESC>:%bd<CR>')
    end,
    after_source = function(session)
      print('Loaded session ' .. session.name)
    end,
  },
})
