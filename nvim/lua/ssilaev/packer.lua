local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
    vim.cmd [[packadd packer.nvim]]
end

return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    -- lsp
    use("williamboman/nvim-lsp-installer")
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("nvim-lua/plenary.nvim")
    use("hrsh7th/cmp-nvim-lsp-signature-help")

    -- treesitter
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use("nvim-treesitter/playground")
    use("romgrk/nvim-treesitter-context")

    -- git
    use("airblade/vim-gitgutter")
    use("sindrets/diffview.nvim")
    use("tpope/vim-fugitive")

    -- comments
    use("tpope/vim-commentary")

    -- serach
    use("junegunn/fzf.vim")

    -- statusline and dev icons
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    })

    -- colorschemes
    use("NLKNguyen/papercolor-theme")

    -- ingentation and whitespace
    use("lukas-reineke/indent-blankline.nvim")
    use("ntpeters/vim-better-whitespace")

    -- others
    use("preservim/tagbar")
    use("onsails/lspkind-nvim")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
