if vim.fn.empty(vim.fn.glob(vim.g.nvim_home..'/autoload/plug.vim')) == 1 then
  if vim.fn.has('unix') == 1 then
     os.execute [[
         sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
      ]]
  elseif vim.fn.has('win32') == 1 then
    local pipe = io.popen("powershell -command -", "w")

    pipe:write [[
      iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
        ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim/autoload/plug.vim" -Force
    ]]
    pipe:close()
  end
end

local configs = {
  lazy = {},
  start = {}
}

local Plug = {
  begin = vim.fn['plug#begin'],

  -- `end` is a keyword, need something else
  ends = function()
    vim.fn['plug#end']()

    -- Automatically install missing plugins on startup
    vim.cmd [[
      autocmd VimEnter *
        if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
          PlugInstall --sync | q
        endif
    ]]

    -- Run configs after running `Plug`
    for i, config in pairs(configs.start) do
      config()
    end
  end
}

_G.VimPlugApplyConfig = function(plugin_name)
  local fn = configs.lazy[plugin_name]
  if type(fn) == 'function' then fn() end
end

local plug_name = function(repo)
  return repo:match("^[%w-]+/([%w-_.]+)$")
end

-- "Meta-functions"
local meta = {
  -- Function call "operation"
  __call = function(self, repo, opts)
    opts = opts or vim.empty_dict()

    -- `do` and `for` alias declaration
    opts['do'] = opts.run
    opts.run = nil

    opts['for'] = opts.ft
    opts.ft = nil

    vim.call('plug#', repo, opts)

    -- Add basic support to colocate plugin config
    if type(opts.config) == 'function' then
      local plugin = opts.as or plug_name(repo)

      if opts['for'] == nil and opts.on == nil then
        configs.start[plugin] = opts.config
      else
        configs.lazy[plugin] = opts.config

        local user_cmd = [[ autocmd! User %s ++once lua VimPlugApplyConfig('%s') ]]
        vim.cmd(user_cmd:format(plugin, plugin))
      end
    end
  end
}

return setmetatable(Plug, meta)
