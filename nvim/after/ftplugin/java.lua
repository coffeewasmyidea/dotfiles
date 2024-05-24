vim.cmd("set makeprg=java\\ %")

vim.keymap.set("n", "<C-b>", ":split term://java %<CR>")
vim.keymap.set("n", "<Leader>x", ":make<CR>")
