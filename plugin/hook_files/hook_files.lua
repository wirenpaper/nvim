package.path = package.path .. ";/home/saifr/.config/nvim/plugin/hooks/?.lua"
local hooks = require'hooks'
local lualine = require('lualine')

local M = {}

M.MARKER = "__f__"

-- Telescope requirements
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local previewers = require('telescope.previewers')

local function file_content(source_path)
    local source_file = io.open(source_path, "r")
    if not source_file then
        print("Error: Could not open " .. source_path .. " for reading.")
        return
    end
    local content = source_file:read("*all")
    source_file:close()
    return content
end

local function file_write(content, target_path)
    local target_file = io.open(target_path, "w")
    if not target_file then
        print("Error: Could not open " .. target_path .. " for writing.")
        return
    end

    target_file:write(content)
    target_file:close()
end

local function file_copy(source_path, target_path)
    local content = file_content(source_path)
    file_write(content, target_path)
end

local function bookmark(fname, marker_path)
    local file = io.open(marker_path, "w")
    if file then
        file:write(fname)
        file:close()
    else
        print("Error: Could not open " .. M.MARKER .. " for writing.")
    end
end

local function set_hookfiles(fname)
    local config = lualine.get_config()
    config.sections.lualine_x[3] = function() return fname end
    config.inactive_sections.lualine_x[3] = function() return fname end
    lualine.setup(config)
end

local function comp(ArgLead, CmdLine, CursorPos)
    local files = vim.fn.readdir(hooks.path .. '/.hook_files/', function(name)
        return name ~= M.MARKER and name:sub(1, #ArgLead) == ArgLead
    end)
    return files
end

function M.hook_files(arg, flt)
    local hook_files = vim.fn.readdir(hooks.path .. '/.hook_files/', function(name)
        return name ~= M.MARKER and name ~= flt
    end)

    pickers.new({}, {
        prompt_title = "filter",
        layout_config = {
            width = .99,
            preview_width = 0.8,
        },
        finder = finders.new_table {
            results = hook_files,
            -- Add path here so the previewer can access it
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry,
                    ordinal = entry,
                    path = hooks.path .. '/.hook_files/' .. entry,
                }
            end
        },
        previewer = previewers.new_buffer_previewer({
            title = arg,
            define_preview = function(self, entry)
                -- Read and display file contents
                local content = vim.fn.readfile(entry.path)
                vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, content)

                -- Optionally set filetype for syntax highlighting
                -- You might want to detect this based on file extension
                vim.bo[self.state.bufnr].filetype = 'lua'
            end,
        }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                local entry = action_state.get_selected_entry()
                actions.close(prompt_bufnr)

                -- Schedule the print to ensure it runs after telescope closes
                vim.schedule(function()
                    if arg == "SWITCH" then
                        hookfiles(entry.value)
                    elseif arg == "DELETE" then
                        hookfiles_del(entry.value)
                    elseif arg == "RENAME" then
                        hookfiles_ren(entry.value, entry.value)
                    elseif arg == "COPY" then
                        hookfiles_cp(entry.value)
                    elseif string.sub(arg, 1, 7) == "RENAME " then
                        local path = hooks.path .. "/.hook_files/" .. string.sub(arg, 8)
                        if entry and entry.value then
                            vim.ui.input({
                                prompt = "Workspace exists, Continue? (y/n): "
                            }, function(input)
                                if input == "y" then
                                    hookfiles_ren_ex(path, hooks.path .. "/.hook_files/" .. entry.value)
                                else
                                    print("command cancelled")
                                end
                            end)
                        else
                            hookfiles_ren_ex(path, hooks.path .. "/.hook_files/" .. action_state.get_current_line())
                        end
                    elseif string.sub(arg, 1, 5) == "COPY " then
                        if entry and entry.value then
                            hookfiles_cp_ex(string.sub(arg, 8), hooks.path .. "/.hook_files/" .. entry.value)
                        else
                            hookfiles_cp_ex(string.sub(arg, 8), hooks.path .. "/.hook_files/" .. action_state.get_current_line())
                        end
                    end
                end)
            end)
            return true
        end,
    }):find()
end

-- telescope commands
vim.api.nvim_create_user_command('RoTelescope', function() M.hook_files("SWITCH") end, {})
vim.api.nvim_create_user_command('RdoTelescope', function() M.hook_files("DELETE") end, {})

vim.api.nvim_create_user_command('Wm', function() 
    vim.ui.input({
        prompt = "Current workspace? (y/n): "
    }, function(input)
        flt = file_content(hooks.path .. "/.hook_files/" .. M.MARKER)
        if input == "n" then
            M.hook_files("RENAME", flt) 
        elseif input == "y" then
            hookfiles_ren(file_content(hooks.path .. "/.hook_files/" .. M.MARKER), flt)
        else
            print("incorrect choice")
        end
    end)
end, {})

function hookfiles_ren(fname, flt)
    local source_path = hooks.path .. '/.hook_files/' .. fname
    M.hook_files("RENAME " .. source_path:match("([^/]+)$"), flt)
end

function hookfiles_ren_ex(file, target)
    function ren(file, target)
        vim.fn.rename(file, target)
        if file:match("([^/]+)$") == file_content(hooks.path .. "/.hook_files/" .. M.MARKER) then
            bookmark(target:match("([^/]+)$"), hooks.path .. "/.hook_files/" .. M.MARKER)
            set_hookfiles(target:match("([^/]+)$"))
        end
        print(file:match("([^/]+)$") .. " -> " .. target:match("([^/]+)$"))
    end

    if source == target then
        print("same file")
        return
    end

    if vim.fn.filereadable(target) == 1 then
        vim.ui.input({
            prompt = "File exists. Overwrite? (y/n): "
        }, function(input)
            if input == "y" then
                ren(file, target)
            else
                print("Rename cancelled")
            end
        end)
        return
    end

    ren(file, target)
end

vim.api.nvim_create_user_command('RcpTelescope', function() M.hook_files("COPY") end, {})

function hookfiles_cp(fname)
    local source_path = hooks.path .. '/.hook_files/' .. fname
    M.hook_files("COPY " .. source_path)
end

function hookfiles_cp_ex(file, target)
    function cp(file, target)
        vim.loop.fs_copyfile(file, target)
        print(file:match("([^/]+)$") .. " -> " .. target:match("([^/]+)$") .. " [COPIED]")
    end

    if source == target then
        print("same file")
        return
    end

    if vim.fn.filereadable(target) == 1 then
        vim.ui.input({
            prompt = "File exists. Overwrite? (y/n): "
        }, function(input)
            if input == "y" then
                cp(file, target)
            else
                print("Copy cancelled")
            end
        end)
        return
    end

    cp(file, target)
end

function hookfiles(fname)
    local target_path = hooks.path .. '/hooks'
    local source_path = hooks.path .. '/.hook_files/' .. fname
    file_copy(source_path, target_path)

    local marker_path = hooks.path .. '/.hook_files/' .. M.MARKER
    bookmark(fname, marker_path)

    set_hookfiles(fname)
    hooks.on_buffer_enter()
end

function hookfiles_del(fname)
    local file = hooks.path .. '/.hook_files/' .. fname
    local success, err = os.remove(file)

    if success then
        print(fname .. " deleted")
    else
        print(fname .. " not deleted; error: " .. err)
        return
    end
end

local commands = {
    Ro = hookfiles,
    Rdo = hookfiles_del
}

for cmd, func in pairs(commands) do
    vim.api.nvim_create_user_command(cmd, function(opts)
        func(opts.args)
    end, {
        nargs = 1,
        complete = comp
    })
end

vim.api.nvim_create_user_command('Rso', function()
    local fname = file_content(hooks.path .. "/.hook_files/" .. M.MARKER)
    set_hookfiles(fname)
end, {})

M.file_content = file_content

return M
