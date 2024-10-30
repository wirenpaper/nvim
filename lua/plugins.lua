return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'jez/vim-better-sml'
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
    use 'wolandark/vim-live-server'
    use 'philj56/vim-asm-indent'
    use 'vigoux/oak'
    use 'rockerBOO/boo-colorscheme-nvim'
    use 'tjdevries/colorbuddy.vim'
    use 'RishabhRD/nvim-rdark'
    use 'nvim-tree/nvim-tree.lua'
    use 'marko-cerovac/material.nvim'
    use 'bluz71/vim-moonfly-colors'
    use 'catppuccin/nvim'
    use 'kovisoft/slimv'
    use 'bhurlow/vim-parinfer'
    use 'preservim/nerdtree'
    use 'preservim/nerdcommenter'
    use 'preservim/tagbar'
    use 'ziglang/zig.vim'
    use 'idris-hackers/idris-vim'
    use 'vim-scripts/a.vim'
    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use 'theHamsta/nvim-dap-virtual-text'
    use 'mfussenegger/nvim-dap-python'
    use 'leoluz/nvim-dap-go'
    use 'nvim-telescope/telescope-dap.nvim'
    use {'neoclide/coc.nvim', branch = 'release'}
    use "junegunn/fzf.vim"
    use "nvim-neotest/neotest-vim-test"
    use "nvim-telescope/telescope.nvim"
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
    use "nvim-neotest/nvim-nio"
    use "antoinemadec/FixCursorHold.nvim"
    use 'nvim-neotest/neotest-python'
    use 'folke/neodev.nvim'
    use "nvim-neotest/neotest-go"
    use({
        "nvim-neotest/neotest",
        requires = {
            "nvim-neotest/neotest-go",
            "nvim-neotest/neotest-python",
            -- Your other test adapters here
        },
        config = function()
            -- get neotest namespace (api call creates or returns namespace)
            local neotest_ns = vim.api.nvim_create_namespace("neotest")
            vim.diagnostic.config({
                virtual_text = {
                    format = function(diagnostic)
                        local message =
                        diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                        return message
                    end,
                },
            }, neotest_ns)
            require("neotest").setup({
                -- your neotest config here
                adapters = {
                    require("neotest-go"),
                    require("neotest-python"),
                },
            })
        end,
    })
    require("neotest").setup({
        adapters = {
            require("neotest-python"),
            require("neotest-go"),
        }
    })

    use 'sainnhe/sonokai'
    use 'ishan9299/modus-theme-vim'
    use 'DilanGMB/nightbuddy'
    use 'shaunsingh/solarized.nvim'
    use 'honza/vim-snippets'
end)
