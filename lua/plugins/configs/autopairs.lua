 local autopairs_present, autopairs = pcall(require, 'nvim-autopairs')
 local cmp_present, cmp = pcall(require, 'cmp')

 if not autopairs_present and cmp_present then
    return
 end

 local options = {
    fast_wrap = {},
    disable_filetype = { 'TelescopePrompt', 'vim' },
 }

 autopairs.setup(options)

 local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
 cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
