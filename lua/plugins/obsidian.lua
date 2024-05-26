return {
  'epwalsh/obsidian.nvim',
  lazy = false,
  cond = function()
    local obsidian_path = vim.fn.expand('~/Obsidian/nvim')
    return vim.loop.fs_stat(obsidian_path) and vim.loop.fs_stat(obsidian_path).type == 'directory'
  end,
  version = '*',
  event = {
    'BufReadPre ~/Obsidian/**.md',
    'BufNewFile ~/Obsidian/**.md',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
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
      checkboxes = {
        [' '] = { char = '󰄰', hl_group = 'ObsidianTodo' },
        ['x'] = { char = '󰄴', hl_group = 'ObsidianDone' },
      },
    },
    note_id_func = function(title)
      local filename = ''

      if title ~= nil then
        filename = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
      else
        for _ = 1, 4 do
          filename = filename .. string.char(math.random(65, 90))
        end

        filename = tostring(os.time()) .. '-' .. filename
      end

      return filename
    end,
  },
  config = function(_, opts)
    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = vim.fn.expand('~') .. '/Obsidian/**.md',
      callback = function()
        local bufname = vim.api.nvim_buf_get_name(0)
        local dirname = vim.fn.fnamemodify(bufname, ':h')

        vim.fn.mkdir(dirname, 'p')
        vim.api.nvim_command('write')
      end,
    })

    require('obsidian').setup(opts)
  end,
}
