" let g:EasyMotion_do_mapping = 0 " Disable default mappings
" " Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
let g:EasyMotion_verbose = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_prompt = '🔎 '

" s{char}{char} to move to {char}{char}
nmap <silent> s <Plug>(easymotion-s2)
