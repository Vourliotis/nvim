local options = {                          -- :help options
  backup = false,                          -- Don't create a backup file
  clipboard = 'unnamedplus',               -- Allow NeoVim to access system clipboard
  conceallevel = 0,                        -- Make `` visible in Markdown files
  fileencoding = 'utf-8',                  -- Use `utf-8` as encoding
  hlsearch = true,                         -- Highlight all matches on previous search pattern
  ignorecase = true,                       -- Ignore case in search patterns
  mouse = 'a',                             -- Allow the mouse to be used in NeoVim
  showmode = false,                        -- Hide NeoVim modes in the status bar
  showtabline = 2,                         -- Always show tabs
  smartcase = true,                        -- Ignore `ignorecase` if search pattern contains upper case characters
  smartindent = true,                      -- Make indenting smarter on newline
  splitbelow = true,                       -- Force all horizontal splits to go below current window
  splitright = true,                       -- Force all vertical splits to go to the right of current window
  swapfile = false,                        -- Don't create a swapfile
  termguicolors = true,                    -- Set term gui colors
  timeoutlen = 1000,                       -- Time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 300,                        -- Faster completion (4000ms default)
  writebackup = false,                     -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- Convert tabs to spaces
  shiftwidth = 2,                          -- The number of spaces inserted for each indentation
  tabstop = 2,                             -- Insert 2 spaces for a tab
  cursorline = true,                       -- Highlight the current line
  number = true,                           -- Set numbered lines
  relativenumber = false,                  -- Don't set relative numbered lines
  signcolumn = 'yes',                      -- Always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- Display long lines as one
  scrolloff = 8,                           -- Minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 8,                       -- Minimal number of screen columns to keep left and right the cursor
  cmdheight = 2,                           -- More space in the neovim command line for displaying messages
  pumheight = 10,                          -- Make popup menu smaller
  background = 'dark'                      -- Tell NeoVim what the background color is
}

vim.opt.shortmess:append 'c'               -- Stop giving messages to ins-compleciton-menu
vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({timeout=200})
  augroup END
]]


for option, setting in pairs(options) do
  vim.opt[option] = setting
end

vim.cmd 'set whichwrap+=<,>,[,],h,l'
vim.cmd [[set iskeyword+=-]]
