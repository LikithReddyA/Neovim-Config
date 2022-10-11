-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})
return require('packer').startup({
    function(use)
        ---------------------
        -- Package Manager --
        ---------------------
        use('wbthomason/packer.nvim')

        ----------------------
        -- Required plugins --
        ----------------------

        use('nvim-lua/plenary.nvim')

        ---------------------
        -- Color Scheme    --
        ---------------------
        use 'shaunsingh/nord.nvim'
        ---------------------
        --   Treesitter    --
        ---------------------
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }
        use {'windwp/nvim-ts-autotag'}
        use {'p00f/nvim-ts-rainbow'}
        use {
            "windwp/nvim-autopairs"
        }
        ---------------------
        --   Nvim Tree     --
        ---------------------
        use {
          'nvim-tree/nvim-tree.lua',
          requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
          }
        }
         ---------------------
         --   Lualine       --
         ---------------------     
        use {
          'nvim-lualine/lualine.nvim',
          requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }
        use {
            'akinsho/bufferline.nvim',
            tag = "v2.*",
            requires = 'kyazdani42/nvim-web-devicons'
        }
  end
})
