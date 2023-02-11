local success, vgit = pcall(require, 'vgit')

if not success then
  return
end

vgit.setup({
  settings = {
    live_blame = {
      enabled = false,
    },
    authorship_code_lens = {
      enabled = false,
    },
    scene = {
      diff_preference = 'split',
    },
  },
})
