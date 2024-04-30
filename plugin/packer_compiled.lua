-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/saifr/.cache/nvim/packer_hererocks/2.1.1692716794/share/lua/5.1/?.lua;/home/saifr/.cache/nvim/packer_hererocks/2.1.1692716794/share/lua/5.1/?/init.lua;/home/saifr/.cache/nvim/packer_hererocks/2.1.1692716794/lib/luarocks/rocks-5.1/?.lua;/home/saifr/.cache/nvim/packer_hererocks/2.1.1692716794/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/saifr/.cache/nvim/packer_hererocks/2.1.1692716794/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["a.vim"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/a.vim",
    url = "https://github.com/vim-scripts/a.vim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\nX\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\31asdghklqwertyuiopzxcvbnmfj\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["idris-vim"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/idris-vim",
    url = "https://github.com/idris-hackers/idris-vim"
  },
  ["neo-tree.nvim"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  neovim = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/neovim",
    url = "https://github.com/rose-pine/neovim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  nerdtree = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/rust.vim",
    url = "https://github.com/rust-lang/rust.vim"
  },
  slimv = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/slimv",
    url = "https://github.com/kovisoft/slimv"
  },
  tagbar = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/tagbar",
    url = "https://github.com/preservim/tagbar"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-colorschemes"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/vim-colorschemes",
    url = "https://github.com/flazz/vim-colorschemes"
  },
  ["vim-darkness"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/vim-darkness",
    url = "https://github.com/Jorengarenar/vim-darkness"
  },
  ["vim-linux-coding-style"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/vim-linux-coding-style",
    url = "https://github.com/vivien/vim-linux-coding-style"
  },
  ["vim-parinfer"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/vim-parinfer",
    url = "https://github.com/bhurlow/vim-parinfer"
  },
  ["vim-rainbow"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/vim-rainbow",
    url = "https://github.com/frazrepo/vim-rainbow"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/vim-rooter",
    url = "https://github.com/airblade/vim-rooter"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  },
  ["zig.vim"] = {
    loaded = true,
    path = "/home/saifr/.local/share/nvim/site/pack/packer/start/zig.vim",
    url = "https://github.com/ziglang/zig.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\nX\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\31asdghklqwertyuiopzxcvbnmfj\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
