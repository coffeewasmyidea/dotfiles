vim.cmd("set makeprg=ghc\\ -dynamic\\ %")

vim.keymap.set("n", "<C-b>", ":!clear;ghc -dynamic %<CR>")
vim.keymap.set("n", "<Leader>x", ":!clear;ghc -dynamic % && ./hello<CR>")
