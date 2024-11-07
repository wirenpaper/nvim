package.path = package.path .. ";/home/saifr/.config/nvim/plugin/hooks/?.lua"
local hooks = require'hooks'
local Queue = require'queue'

local M = {}

--local item = Queue.dequeue(queue)
--item = Queue.dequeue(queue)

function run_tasks()
    local queue = Queue.new()
    Queue.enqueue(queue, "ng serve")
    Queue.enqueue(queue, "ng serve --port 4209")

    local command = Queue.dequeue(queue)
    ng_serve(command)
    print("haahaa")
end

local task_path = hooks.path .. '/.hook_files/tasks/'
function ng_serve(command)
    vim.cmd("redraw")
    -- Determine the working directory based on the task_path
    local working_dir = vim.fn.fnamemodify(task_path, ":h:h")
    local job_id = vim.fn.jobstart(command, {
        cwd = working_dir,
        detach = true,
        stdout_buffered = true,
        stderr_buffered = true,
    })

    if job_id > 0 then
        print('Local server started with job ID:', job_id)

        -- Actually check if port 4200 is accepting connections
        local start_time = vim.loop.now()
        local function check_port()
            local check_command = "nc -z localhost 4200"

            local port_check = vim.fn.system(check_command)
            local is_ready = vim.v.shell_error == 0

            if is_ready then
                print("Server is ready on port 4200!")
                return
            elseif (vim.loop.now() - start_time) > 20000 then  -- 20 seconds timeout
                print("Server failed to start after 20 seconds")
                return
            else
                vim.defer_fn(check_port, 1000)  -- Check again in 1 second
            end
        end

        check_port()  -- Start checking
    else
        vim.cmd("redraw")
        print('Failed to start local server')
    end
end

vim.api.nvim_create_user_command('RunTasks', run_tasks, {})
-- kill -9 $(lsof -t -i:4200)

function AttachToLocalServer()
  local job_id = 0 -- Replace this with the job ID you got from running ng_serve
  vim.fn.termopen('', {
    on_stdout = function(_, data, _)
      print(table.concat(data, '\n'))
    end,
    on_stderr = function(_, data, _)
      print(table.concat(data, '\n'))
    end,
    on_exit = function(_, code, _)
      if code ~= 0 then
        print('Local server exited with code:', code)
      end
    end,
    detach = false, -- Keep the terminal attached
    stoponexit = 'kill', -- Kill the job when the terminal is closed
    job_id = job_id, -- Attach to the specific job ID
  })
end

function KillLocalServer(job_id)
    vim.fn.jobstop(job_id)
    print("Local server stopped with job ID:", job_id)
end

return M
