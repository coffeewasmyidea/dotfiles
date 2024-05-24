vim.cmd("set makeprg=demo\\ %")

vim.keymap.set("n", "gd", ":LspDefinition<CR>")
