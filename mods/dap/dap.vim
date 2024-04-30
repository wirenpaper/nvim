lua << EOF
local dap = require('dap')
dap.adapters.lldb = {
	type = 'executable',
	command = '/usr/bin/lldb-vscode-14', -- adjust as needed, must be absolute path
	name = 'lldb'
}

local dap = require('dap')
dap.configurations.cpp = {
	{
			name = 'Launch',
			type = 'lldb',
			request = 'launch',
			program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			end,
			cwd = '${workspaceFolder}',
			stopOnEntry = false,
			args = {},

			-- if you change `runInTerminal` to true, you might need to change the 
			-- yama/ptrace_scope setting:
			--
			--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
			--
			-- Otherwise you might get the following error:
			--
			--    Error on launch: Failed to attach to the target process
			--
			-- But you should be aware of the implications:
			-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
			-- runInTerminal = false,
	},
}
dap.configurations.c = dap.configurations.cpp
EOF


nnoremap <leader>df :Telescope dap frames<CR>
nnoremap <leader>db :Telescope dap list_breakpoints<CR>

nnoremap <leader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <leader>c :lua require'dap'.continue()
nnoremap <leader>dc :lua require'dap'.close()<CR>
nnoremap <leader>n :lua require'dap'.step_over()<CR>
nnoremap <leader>i :lua require'dap'.step_into()<CR>
nnoremap <leader>t :lua require'dap'.terminate()<CR>
nnoremap <leader>r :lua require'dap'.repl.open()<CR>
nnoremap <leader>di :lua require'dap.ui.widget'.hover()<CR>
nnoremap <leader>d? :lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>
