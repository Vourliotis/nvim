local M = {}

M.bootstrap = function()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})

    print "Cloning packer .."

    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }

    -- Install Plugins
    vim.cmd 'packadd packer.nvim'
    require 'plugins'
    vim.cmd 'PackerSync'
  end
end

M.options = {
  auto_clean = true,
  compile_on_sync = true,
  git = { clone_timeout = 6000 },
  display = {
     working_sym = " ﲊ",
     error_sym = "✗ ",
     done_sym = " ",
     removed_sym = " ",
     moved_sym = "",
     open_fn = function()
        return require("packer.util").float { border = "single" }
     end,
  },
}

M.run = function(plugins)
  local present, packer = pcall(require, "packer")

  if not present then
     return
  end

  packer.init(M.options)

  packer.startup(function(use)
    local merged_plugins = {}

    for key, _ in pairs(plugins) do
      plugins[key][1] = key
      merged_plugins[#merged_plugins + 1] = plugins[key]
    end

    for _, v in pairs(merged_plugins) do
       use(v)
    end
  end)
end

return M
