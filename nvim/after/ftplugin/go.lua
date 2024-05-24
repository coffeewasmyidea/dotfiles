vim.cmd("set makeprg=go\\ build")
vim.cmd("abb pp fmt.Println();<Left><Left>")

vim.keymap.set("n", "<F5>", ":GoFmt<CR>")
vim.keymap.set("n", "<C-b>", ":!clear;go build<CR>")
vim.keymap.set("n", "<Leader>x", ":!clear;go run %<CR>")
