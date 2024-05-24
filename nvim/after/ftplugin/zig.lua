vim.cmd("set makeprg=zig\\ build")
vim.g.zig_fmt_autosave = 0

vim.keymap.set("n", "<Leader>x", ":split term://zig build run<CR>")
vim.keymap.set("n", "<F5>", ":!clear;zig fmt %<CR>")
