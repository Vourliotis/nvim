local autopairs_success, autopairs = pcall(require, 'nvim-autopairs')
local cmp_success, cmp = pcall(require, 'cmp')

if not (autopairs_success and cmp_success) then
  return
end

autopairs.setup({
  check_ts = true,
})

cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
