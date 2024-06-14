
vim.cmd(":so $HOME/.config/nvim/nolua.vim")

-- VSCode extension
if not vim.g.vscode then
    -- ordinary Neovim
    require("coffeewasmyidea")

-- Color scheme
    vim.o.background = "dark" -- or "light" for light mode
    vim.cmd([[colorscheme gruvbox]])

    -- Mason
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = {
            "rust_analyzer",
            "gopls",
            "clangd",
            "pyright",
            "cmake",
            "marksman",
        },
        automatic_installation = true,
    })

    -- LSP config
    local lsp = require("lsp-zero")

    lsp.preset("recommended")
    lsp.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp.default_keymaps({buffer = bufnr})
    end)

    -- Setup handlers
    require("mason-lspconfig").setup_handlers {
        -- Default handler for all installed servers except rust_analyzer
        function(server_name)
            if server_name ~= "rust_analyzer" then
                lsp.configure(server_name, {})
            end
        end,
        -- Custom handler for rust_analyzer (inactive)
        ["rust_analyzer"] = function()
            -- No setup for rust_analyzer
        end,
    }

    -- Apply lsp-zero settings
    lsp.setup()

    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()
    local cmp_select = {behavior = cmp.SelectBehavior.Select}

    cmp.setup({
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        -- `Enter` or `CR` key to confirm completion
        ["<Tab>"] = cmp.mapping.confirm({select = true}),
        ["<CR>"] = cmp.mapping.confirm({select = true}),
    })
    })

    lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {
            error = "E",
            warn = "W",
            hint = "H",
            info = "I"
        }
    })

    lsp.on_attach(function(client, bufnr)
      local opts = {buffer = bufnr, remap = false}

        vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
        vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
        vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
        vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

        vim.diagnostic.config({
          virtual_text = true,
          signs = true,
          underline = true,
          update_in_insert = false,
          severity_sort = false,
        })

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<space>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<space>di", vim.diagnostic.disable, opts)
        vim.keymap.set("n", "<space>en", vim.diagnostic.enable, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<space>vq", vim.diagnostic.setloclist, opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

    end)

    function PrintDiagnostics(opts, bufnr, line_nr, client_id)
      bufnr = bufnr or 0
      line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
      opts = opts or {['lnum'] = line_nr}

      local line_diagnostics = vim.diagnostic.get(bufnr, opts)
      if vim.tbl_isempty(line_diagnostics) then return end

      local diagnostic_message = ""
      for i, diagnostic in ipairs(line_diagnostics) do
        diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
        print(diagnostic_message)
        if i ~= #line_diagnostics then
          diagnostic_message = diagnostic_message .. "\n"
        end
      end
      vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
    end

    lsp.setup()

    -- Git
    require("gitsigns").setup{
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end, {expr=true})

        map("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, {expr=true})
    end
    }

    -- Zen
    require("zen-mode").setup { window = { width = 100, }, }
    vim.keymap.set("n", "<leader>zz", function()
        require("zen-mode").toggle()
    end)

    require("telescope").setup{
        defaults = {
            file_ignore_patterns = {
                "venv/.*",
                ".vnev/.*",
                "yarn%.lock",
                "package%-lock%.json",
                "pnpm%-lock%.yaml",
                "node_modules/.*",
                "%.git/.*",
                "%.webp",
                "%.avif",
                "%.heic",
                "%.mp3",
                "%.mp4",
                "%.mkv",
                "%.mov",
                "%.wav",
                "%.avi",
                "%.webm",
                "%.ttf",
                "%.otf",
                "%.woff",
                "%.woff2",
                "%.svg",
                "%.png",
                "%.jpeg",
                "%.jpg",
                "%.ico",
                ".env.*",
                "%.db",
                ".env.*",
                ".yarn/.*",
                "go%.sum"
            },
            scroll_strategy = "cycle",
            sorting_strategy = "ascending"
        }
    }

    -- Harpoon
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>a", mark.add_file)
    vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
    vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
    vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
    vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
    vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)

    -- Autopairs
    require("nvim-autopairs").setup({
        disable_filetype = { "vim" },
    })

    -- Statusline
    vim.cmd("set statusline=%<%f\\ %h%m%r%=%-16.(%y\\ %l,%c\\ %)\\ %P\\ \\ ")

    -- Go
    require("go").setup()

end
