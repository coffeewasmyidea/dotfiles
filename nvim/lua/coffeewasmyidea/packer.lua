local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim", install_path
    })
    vim.cmd [[packadd packer.nvim]]
end

return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    -- LSP
    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      requires = {
        --- Uncomment these if you want to manage LSP servers from neovim
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- LSP Support
        {'neovim/nvim-lspconfig'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},

        -- Snippets
        {"L3MON4D3/LuaSnip"},
        {"rafamadriz/friendly-snippets"},
      }
    }

    -- Mason
    use("williamboman/mason.nvim")

    -- Colorscheme
    use { "ellisonleao/gruvbox.nvim" }

    -- Snips
    use("sirver/UltiSnips")

    -- Git
    use("lewis6991/gitsigns.nvim")
    use("tpope/vim-fugitive")

    -- Go
    use("ray-x/go.nvim")
    use("ray-x/guihua.lua")

    -- Rust
    use("mrcjkb/rustaceanvim")

    -- Comments
    use("tpope/vim-commentary")

    -- Serach
    use { "nvim-telescope/telescope.nvim", requires = { {"nvim-lua/plenary.nvim"} } }

    -- Autopairs
    use {"windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end}

    -- Black (Python)
    use("psf/black")

    -- Tagbar
    use("preservim/tagbar")

    -- Harpoon (The Primagen)
    use("theprimeagen/harpoon")

    -- Undotree
    use("mbbill/undotree")

    -- Zen mode
    use("folke/zen-mode.nvim")

    -- Others
    use("onsails/lspkind-nvim")
    use("nvim-treesitter/nvim-treesitter")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
