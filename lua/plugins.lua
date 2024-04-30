return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'flazz/vim-colorschemes'
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'asdghklqwertyuiopzxcvbnmfj' }
        end
    }
    require'hop'.setup()
    use 'ARM9/arm-syntax-vim'
    use 'philj56/vim-asm-indent'
    use 'vigoux/oak'
    use 'rockerBOO/boo-colorscheme-nvim'
    --And then somewhere in your init.vim, to set the colorscheme
    use 'tjdevries/colorbuddy.vim'
    use 'RishabhRD/nvim-rdark'
    use 'marko-cerovac/material.nvim'
    use 'bluz71/vim-moonfly-colors'
    use 'catppuccin/nvim'
    use 'kovisoft/slimv'
    use 'bhurlow/vim-parinfer'
    --use 'HiPhish/rainbow-delimiters.nvim'
    use 'preservim/nerdtree'
    use 'preservim/nerdcommenter'
    use 'preservim/tagbar'
    use 'ziglang/zig.vim'
    use 'idris-hackers/idris-vim'
    --use 'gregkh/kernel-coding-style'
    --use "vivien/vim-linux-coding-style"
    use 'vim-scripts/a.vim'
    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use 'theHamsta/nvim-dap-virtual-text'
    use 'mfussenegger/nvim-dap-python'
    use 'leoluz/nvim-dap-go'
    use 'nvim-telescope/telescope-dap.nvim'
    --use 'airblade/vim-rooter'
    use {'neoclide/coc.nvim', branch = 'release'}
    use "nvim-telescope/telescope.nvim"
    require('telescope').load_extension('fzf')
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "Jorengarenar/vim-darkness"
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        }
    }
    use "rust-lang/rust.vim"
    use "liuchengxu/vista.vim"
    use "nvim-lualine/lualine.nvim"
    use "rose-pine/neovim"
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        }
    }
    use 'nvim-neotest/neotest-python'
    require("neotest").setup({
        adapters = {
            require("neotest-python")
        }
    })
    use 'nvim-neotest/neotest-plenary'
    use 'nvim-neotest/neotest-vim-test'
    require("neotest").setup({
        adapters = {
            require("neotest-python")({
                dap = { justMyCode = false },
            }),
            require("neotest-plenary"),
            require("neotest-vim-test")({
                ignore_file_types = { "python", "vim", "lua" },
            }),
        },
    })
    use 'folke/neodev.nvim'
end)
