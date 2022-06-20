 local present, luasnip = pcall(require, "luasnip")

 if not present then
    return
 end

 local options = {
    history = true,
    updateevents = "TextChanged,TextChangedI",
 }

 luasnip.config.set_config(options)
 luasnip.filetype_extend('ruby', {'rails'})
 require("luasnip.loaders.from_vscode").lazy_load()
