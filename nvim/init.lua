require("ssilaev")

vim.opt.termguicolors = true
vim.opt.nu = true
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

-- better whitespace blacklist
-- vim.g.better_whitespace_filetypes_blacklist = {'c', 'python', 'rs', 'lua'}

-- use .gitignore
-- vim.g.netrw_list_hide = (vim.fn["netrw_gitignore#Hide"]()) .. [[,\(^\|\s\s\)\zs\.\S\+]]

-- default to tree mode
vim.g.netrw_liststyle = 3

-- colorscheme
vim.cmd("colorscheme PaperColor")
vim.opt.background = "light"

-- copy/paste
vim.opt.clipboard = "unnamedplus"

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

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
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

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
}
)

-- F keys
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
    sources = {
      { name = 'nvim_lsp' },
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

-- tree-sitter
require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "python", "c", "cpp", "rust", "go", "html", "css", "lua", "sql" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = { "javascript" },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}

vim.opt.list = true
vim.opt.listchars:append "space:."
vim.opt.listchars:append "eol:¬"

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
}

-- lualine
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

