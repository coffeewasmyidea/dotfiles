vim.opt.textwidth = 99

-- vim.opt.nu = true
vim.keymap.set("n", "<F5>", ":RustFmt<CR>")
vim.keymap.set("n", "<C-b>", ":Cargo build<CR>")
vim.keymap.set("n", "<Leader>x", ":RustRun<CR>")
vim.keymap.set("n", "<S-k>", ":lua vim.lsp.buf.hover()<CR>")

vim.cmd("abb dd #[derive(Debug)]")

