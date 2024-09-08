return {
  'epwalsh/obsidian.nvim',
  lazy = false,
  cond = function()
    local obsidian_path = vim.fn.expand('~/Obsidian/nvim')
    return vim.loop.fs_stat(obsidian_path) and vim.loop.fs_stat(obsidian_path).type == 'directory'
  end and not vim.g.vscode,
  version = '*',
  event = {
    'BufReadPre ~/Obsidian/**.md',
    'BufNewFile ~/Obsidian/**.md',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  init = function()
    vim.api.nvim_create_autocmd('BufNewFile', {
      pattern = vim.fn.expand('~') .. '/Obsidian/**.md',
      callback = function()
        local bufname = vim.api.nvim_buf_get_name(0)
        local dirname = vim.fn.fnamemodify(bufname, ':h')

        vim.fn.mkdir(dirname, 'p')
        vim.api.nvim_command('write')
      end,
    })
  end,
  keys = {
    { '<LEADER>ot', '<CMD>ObsidianToday<CR>', mode = 'n' },
    { '<LEADER>oy', '<CMD>ObsidianYesterday<CR>', mode = 'n' },
    { '<LEADER>os', '<CMD>ObsidianSearch<CR>', mode = 'n' },
    { '<LEADER>oq', '<CMD>ObsidianQuickSwitch<CR>', mode = 'n' },
    { '<LEADER>of', '<CMD>ObsidianFollowLink<CR>', mode = 'n' },
    { '<LEADER>ob', '<CMD>ObsidianBacklinks<CR>', mode = 'n' },
    { '<LEADER>od', '<CMD>ObsidianDailies<CR>', mode = 'n' },
    { '<LEADER>on', '<CMD>ObsidianNew<CR>', mode = 'n' },
  },
  opts = {
    workspaces = {
      {
        name = 'nvim',
        path = '~/Obsidian/nvim',
      },
    },
    daily_notes = {
      folder = 'Dailies',
      date_format = '%d-%m-%Y',
    },
    ui = {
      enable = false,
      checkboxes = {
        [' '] = { char = '󰄰', hl_group = 'ObsidianTodo' },
        ['x'] = { char = '󰄴', hl_group = 'ObsidianDone' },
      },
    },
    note_id_func = function(title)
      return title
    end,
    follow_url_func = function(url)
      vim.fn.jobstart({ 'xdg-open', url })
    end,
    disable_frontmatter = true,
  },
}
