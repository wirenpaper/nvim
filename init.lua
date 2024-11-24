vim.cmd([[source ~/.config/nvim/mods/mods.vim]])
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})
vim.keymap.set("n", "<leader>fe", vim.diagnostic.open_float)

vim.g.snacks_dashboard = false

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.cursorline = false

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.documentHighlightProvider then
      client.server_capabilities.documentHighlightProvider = false
    end
  end,
})

vim.opt.guicursor = "n-v-c:block-Cursor/lCursor-blinkon0"

vim.opt.guicursor = "a:blinkon100"
vim.cmd([[nnoremap dk :te<cr>]])
