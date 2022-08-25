local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
end

return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    -- lsp
    use("neovim/nvim-lspconfig")
    use("williamboman/nvim-lsp-installer")
    use("folke/trouble.nvim")

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

    -- completion
    use({
      "hrsh7th/nvim-cmp",
      requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      },
    })
    use("SirVer/ultisnips")
    use("quangnguyen30192/cmp-nvim-ultisnips")
    use("hrsh7th/cmp-nvim-lsp-signature-help")
    use("nvim-lua/plenary.nvim")

    -- colorschemes
    use("flazz/vim-colorschemes")

    -- ingentation and whitespace
    use("lukas-reineke/indent-blankline.nvim")
    use("ntpeters/vim-better-whitespace")

    -- others
    use("preservim/tagbar")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
