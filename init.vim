source ~/.config/nvim/mods/mods.vim

set t_Co=0
lua require('plugins')
set ignorecase
let g:loaded_matchparen=1

set laststatus=0

au FileType * set fo-=c fo-=r fo-=o
"colo redblack
"colo birds-of-paradise
"colo xterm16
"colo garden
"colo rose-pine-moon
"colo rose-pine
"colo adrian

"colo rose-pine-main
"colo alduin
"colo darkness
colo rose-pine-main
"colo catppuccin-macchiato
"colo white
"colo catppuccin-mocha
"colo revolutions
"colo greens
"colo moonfly
"colo modus-operandi

"colo shades-of-teal
"colo modus-operandi
"colo redstring
"colo pride
"colo dante
"colo darkness
"colo quiet
"colo catppuccin-mocha
"colo oceanblack256
"colo oak
"colo greens
"colo abyss
let g:NERDTreeChDirMode=1

augroup AutoChdir
  autocmd!
  autocmd BufEnter * if &buftype !=# 'terminal' | lchdir %:p:h | endif
augroup END

if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g`\"" | endif
endif

"set nu
"set autoindent expandtab tabstop=4 shiftwidth=4
"set softtabstop=0 noexpandtab
"set shiftwidth=4
"set autoindent
"set smartindent

"""""""""""""""""""""""""""""""""""""""""
" Set default indentation to 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" 2-space indentation for specific file types
autocmd FileType html,typescript,javascript,css setlocal shiftwidth=2 tabstop=2 softtabstop=2

" 4-space indentation for other common languages (explicitly set for clarity)
autocmd FileType python,go,cpp,c,java,rust setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Enable smart indenting
set smartindent

" Enable filetype detection, plugin, and indentation
filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""

lua require('dap-go').setup()
lua << EOF
local function debug_normal()
    require('dap').configurations.go = {
      {
        type = 'go',
        name = 'Debug',
        request = 'launch',
        program = './'
      }
    }
end
vim.api.nvim_create_user_command("DebugNormal", function() debug_normal() end, {})
EOF

lua << EOF
local function debug_test()
    require('dap').configurations.go = {
      {
        type = 'go',
        name = 'Debug Test',
        request = 'launch',
        mode = 'test',
        program = './',
        dlvToolPath = vim.fn.exepath('dlv')
      }
    }
end
vim.api.nvim_create_user_command("DebugTest", function() debug_test() end, {})
EOF

lua << EOF
local dap = require('dap')
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/home/saifr/progs/vsix/extension/debugAdapters/bin/OpenDebugAD7',
}
EOF
"end

"miscelaneous plugin oneliner commands
let g:slime_target = "neovim"
let g:rainbow_active = 0
set mouse=
let g:rooter_patterns = ['.git', 'Makefile']
set clipboard=unnamedplus

"let loaded_matchparen = 0

lua require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
"lua require('colorbuddy').colorscheme('nvim-rdark')

au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7

nnoremap <leader>rf :lua require("neotest").run.run(vim.fn.expand("%"))
nnoremap <leader>rn :lua require("neotest").run.run({strategy = "dap"})



set guicursor=n:block
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2

command! Time echo strftime("%H:%M:%S %A %Y-%m-%d")

" Set file type specific settings
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType typescriptreact setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascriptreact setlocal shiftwidth=2 softtabstop=2 expandtab

" Disable TreeSitter highlighting
"augroup DisableTreesitter
    "autocmd!
    "autocmd VimEnter * TSDisable highlight
"augroup END

" Optional: Disable Vim's built-in syntax highlighting
"syntax off

set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

"Replace the previous TypeScript settings with these
"autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
"autocmd FileType typescript setlocal foldmethod=indent
autocmd FileType * setlocal foldmethod=indent

lua << EOF
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
-- vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF
