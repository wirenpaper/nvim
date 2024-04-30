source ~/.config/nvim/mods/mods.vim

set t_Co=0
lua require('plugins')
set ignorecase
let g:loaded_matchparen=1

set laststatus=0

au FileType * set fo-=c fo-=r fo-=o
"colo birds-of-paradise
"colo xterm16
"colo garden
"colo catppuccin
"colo pride
"colo rose-pine-moon
"colo rose-pine
"colo adrian
"colo catppuccin
colo darkness
"colo quiet
"colo catppuccin-mocha
"colo oceanblack256
"colo oak
"colo greens
"colo dante
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
set autoindent expandtab tabstop=4 shiftwidth=4
set smartindent

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


lua << EOF
local dap = require('dap')

dap.adapters.dart = {
    type = "executable",
    command = "dart",
    -- This command was introduced upstream in https://github.com/dart-lang/sdk/commit/b68ccc9a
    args = {"debug_adapter"}
}
dap.configurations.dart = {
    {
            type = "dart",
            request = "launch",
            name = "Launch Dart Program",
            -- The nvim-dap plugin populates this variable with the filename of the current buffer
            program = "${file}",
            -- The nvim-dap plugin populates this variable with the editor's current working directory
            cwd = "${workspaceFolder}",
            args = {"--help"}, -- Note for Dart apps this is args, for Flutter apps toolArgs
    }
}
EOF

nnoremap <leader>rf :lua require("neotest").run.run(vim.fn.expand("%"))
nnoremap <leader>rn :lua require("neotest").run.run({strategy = "dap"})



set guicursor=n:block
