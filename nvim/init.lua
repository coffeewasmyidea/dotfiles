require("coffeewasmyidea")

vim.opt.termguicolors =true
vim.opt.nu = true
vim.opt.mouse = ""
vim.opt.relativenumber = true
vim.opt.errorbells = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 1
vim.opt.updatetime = 50
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.shortmess:append("c")
vim.opt.autochdir = false

-- better Netrw
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 20

-- better whitespace
vim.g.better_whitespace_enabled = 1
vim.g.strip_whitespace_on_save = 1
vim.g.strip_max_file_size = 1000

-- colorscheme
vim.o.background = 'light'

local c = require('vscode.colors')
require('vscode').setup({
    transparent = false,
    italic_comments = true,
    disable_nvimtree_bg = true,
    group_overrides = {
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})

require("bufferline").setup{
    options = {
      mode = "tabs",
      numbers = "none",
      diagnostics = false,
      show_tab_indicators = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
  }

-- copy/paste
vim.opt.clipboard = "unnamedplus"

-- font-end things
vim.api.nvim_exec("au BufNewFile,BufRead vim.cmd.js,*.html,*.css,*.scss set softtabstop=2", false)
vim.api.nvim_exec("au BufNewFile,BufRead vim.cmd.js,*.html,*.css,*.scss set shiftwidth=2", false)

-- python
vim.g.python3_host_prog = "/usr/bin/python"
vim.g.black_linelength = 120

-- lsp config
require("nvim-lsp-installer").setup({
    automatic_installation = true,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
vim.keymap.set('n', '<space>di', vim.diagnostic.disable, opts)
vim.keymap.set('n', '<space>en', vim.diagnostic.enable, opts)

local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

require('lspconfig')['clangd'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        ["clangd"] = {}
    }
}

require('lspconfig')['pyright'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = false,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "basic",
            },
        },
    }
}

require('lspconfig')['rust_analyzer'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        ["rust-analyzer"] = {}
    }
}

require('lspconfig')['sumneko_lua'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" }, }
        }
    }
}

require('lspconfig')['gopls'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        ["gopls"] = {}
    }
}

require('lspconfig')['sqlls'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        ["sqlls"] = {}
    }
}

require('lspconfig')['dockerls'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        ["dockerls"] = {}
    }
}

-- F keys
vim.keymap.set("n", "<F3>", ":set rnu! nu!<CR>")
vim.keymap.set("n", "<F5>", ":Black<CR>")
vim.keymap.set("n", "<F8>", ":TagbarToggle<CR>")

-- fzf
vim.keymap.set("n", "<C-p>", ":FZF<CR>")
vim.keymap.set("n", "<C-f>", ":Rg<CR>")

-- resize
vim.keymap.set("n", "<M-Down>", ":resize +4<CR>")
vim.keymap.set("n", "<M-Up>", ":resize -4<CR>")
vim.keymap.set("n", "<M-Right>", ":vertical resize +4<CR>")
vim.keymap.set("n", "<M-Left>", ":vertical resize -4<CR>")
vim.keymap.set("n", "<Leader>}", "ysiw")

-- navigate 4x faster when holding down Ctrl
vim.keymap.set("n", "<C-j>", "4j")
vim.keymap.set("n", "<C-k>", "4k")
vim.keymap.set("n", "<C-l>", "4l")
vim.keymap.set("n", "<C-h>", "4h")
vim.keymap.set("n", "<C-Down>", "4<Down>")
vim.keymap.set("n", "<C-Up>", "4<Up>")
vim.keymap.set("n", "<C-Left>", "b")
vim.keymap.set("n", "<C-Right>", "e")

-- for visual mode: x[nore]map
vim.keymap.set("x", "<C-j>", "4j")
vim.keymap.set("x", "<C-k>", "4k")
vim.keymap.set("x", "<C-h>", "4h")
vim.keymap.set("x", "<C-l>", "4l")
vim.keymap.set("x", "<C-Down>", "4<Down>")
vim.keymap.set("x", "<C-Up>", "4<Up>")
vim.keymap.set("x", "<C-Left>", "b")
vim.keymap.set("x", "<C-Right>", "e")

-- noh
vim.keymap.set("n", "<Leader><space>", ":noh<CR>")

-- find and replace
vim.keymap.set("n", "S", ":%s//g<Left><Left>")

-- git
vim.keymap.set('n', '<Leader>b', ":Git blame<CR>")

-- explore
vim.keymap.set('n', '<Leader>e', ":Rexplore<CR>")
vim.keymap.set('n', '<Leader>s', ":Vexplore<CR>")
vim.keymap.set('n', '<Leader>S', ":Hexplore<CR>")
vim.keymap.set('n', '<Leader>T', ":Texplore<CR>")

-- completion config
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'buffer' },
        { name = 'nvim_lsp_signature_help' },
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        })
    }
})

local actions = require("diffview.actions")

require("diffview").setup({
    diff_binaries = false, -- Show diffs for binaries
    enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
    git_cmd = { "git" }, -- The git executable followed by default args.
    use_icons = true, -- Requires nvim-web-devicons
    icons = { -- Only applies when use_icons is true.
        folder_closed = "",
        folder_open = "",
    },
    signs = {
        fold_closed = "",
        fold_open = "",
    },
    file_panel = {
        listing_style = "tree", -- One of 'list' or 'tree'
        tree_options = { -- Only applies when listing_style is 'tree'
            flatten_dirs = true, -- Flatten dirs that only contain one single dir
            folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
        },
        win_config = { -- See ':h diffview-config-win_config'
            position = "left",
            width = 35,
        },
    },
    file_history_panel = {
        log_options = { -- See ':h diffview-config-log_options'
            single_file = {
                diff_merges = "combined",
            },
            multi_file = {
                diff_merges = "first-parent",
            },
        },
        win_config = { -- See ':h diffview-config-win_config'
            position = "bottom",
            height = 16,
        },
    },
    commit_log_panel = {
        win_config = {}, -- See ':h diffview-config-win_config'
    },
    default_args = { -- Default args prepended to the arg-list for the listed commands
        DiffviewOpen = {},
        DiffviewFileHistory = {},
    },
    hooks = {}, -- See ':h diffview-config-hooks'
    keymaps = {
        disable_defaults = false, -- Disable the default keymaps
        view = {
            -- The `view` bindings are active in the diff buffers, only when the current
            -- tabpage is a Diffview.
            ["<tab>"]      = actions.select_next_entry, -- Open the diff for the next file
            ["<s-tab>"]    = actions.select_prev_entry, -- Open the diff for the previous file
            ["gf"]         = actions.goto_file, -- Open the file in a new split in the previous tabpage
            ["<C-w><C-f>"] = actions.goto_file_split, -- Open the file in a new split
            ["<C-w>gf"]    = actions.goto_file_tab, -- Open the file in a new tabpage
            ["<leader>e"]  = actions.focus_files, -- Bring focus to the files panel
            ["<leader>b"]  = actions.toggle_files, -- Toggle the files panel.
        },
        file_panel = {
            ["j"]             = actions.next_entry, -- Bring the cursor to the next file entry
            ["<down>"]        = actions.next_entry,
            ["k"]             = actions.prev_entry, -- Bring the cursor to the previous file entry.
            ["<up>"]          = actions.prev_entry,
            ["<cr>"]          = actions.select_entry, -- Open the diff for the selected entry.
            ["o"]             = actions.select_entry,
            ["<2-LeftMouse>"] = actions.select_entry,
            ["-"]             = actions.toggle_stage_entry, -- Stage / unstage the selected entry.
            ["S"]             = actions.stage_all, -- Stage all entries.
            ["U"]             = actions.unstage_all, -- Unstage all entries.
            ["X"]             = actions.restore_entry, -- Restore entry to the state on the left side.
            ["R"]             = actions.refresh_files, -- Update stats and entries in the file list.
            ["L"]             = actions.open_commit_log, -- Open the commit log panel.
            ["<c-b>"]         = actions.scroll_view(-0.25), -- Scroll the view up
            ["<c-f>"]         = actions.scroll_view(0.25), -- Scroll the view down
            ["<tab>"]         = actions.select_next_entry,
            ["<s-tab>"]       = actions.select_prev_entry,
            ["gf"]            = actions.goto_file,
            ["<C-w><C-f>"]    = actions.goto_file_split,
            ["<C-w>gf"]       = actions.goto_file_tab,
            ["i"]             = actions.listing_style, -- Toggle between 'list' and 'tree' views
            ["f"]             = actions.toggle_flatten_dirs, -- Flatten empty subdirectories in tree listing style.
            ["<leader>e"]     = actions.focus_files,
            ["<leader>b"]     = actions.toggle_files,
        },
        file_history_panel = {
            ["g!"]            = actions.options, -- Open the option panel
            ["<C-A-d>"]       = actions.open_in_diffview, -- Open the entry under the cursor in a diffview
            ["y"]             = actions.copy_hash, -- Copy the commit hash of the entry under the cursor
            ["L"]             = actions.open_commit_log,
            ["zR"]            = actions.open_all_folds,
            ["zM"]            = actions.close_all_folds,
            ["j"]             = actions.next_entry,
            ["<down>"]        = actions.next_entry,
            ["k"]             = actions.prev_entry,
            ["<up>"]          = actions.prev_entry,
            ["<cr>"]          = actions.select_entry,
            ["o"]             = actions.select_entry,
            ["<2-LeftMouse>"] = actions.select_entry,
            ["<c-b>"]         = actions.scroll_view(-0.25),
            ["<c-f>"]         = actions.scroll_view(0.25),
            ["<tab>"]         = actions.select_next_entry,
            ["<s-tab>"]       = actions.select_prev_entry,
            ["gf"]            = actions.goto_file,
            ["<C-w><C-f>"]    = actions.goto_file_split,
            ["<C-w>gf"]       = actions.goto_file_tab,
            ["<leader>e"]     = actions.focus_files,
            ["<leader>b"]     = actions.toggle_files,
        },
        option_panel = {
            ["<tab>"] = actions.select_entry,
            ["q"]     = actions.close,
        },
    },
})

vim.opt.list = true

-- tree-sitter
require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "python", "c", "cpp", "rust", "go", "html", "css", "lua", "sql" },
    sync_install = false,
    auto_install = true,
    ignore_install = { "javascript" },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
}
