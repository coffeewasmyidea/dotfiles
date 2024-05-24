vim.cmd("set makeprg=zig\\ c++\\ %")

vim.keymap.set("n", "<Leader>x", ":split term://zig c++ % && ./a.out<CR>")
vim.keymap.set("n", "<C-b>", ":split term://zig c++ %<CR>")

vim.g.vebugger_path_gdb = "gdb"

vim.opt.spell = false
vim.opt.wrap = false
vim.opt.textwidth = 99
