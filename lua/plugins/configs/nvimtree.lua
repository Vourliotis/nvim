local present, nvimtree = pcall(require, 'nvim-tree')

if not present then
  return
end

local options = {
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  view = {
    width = 25,
    hide_root_folder = true,
    adaptive_size = true,
  },
  git = {
    enable = false,
  },
  renderer = {
    indent_markers = {
      enable = false,
    },
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
}

nvimtree.setup(options)
