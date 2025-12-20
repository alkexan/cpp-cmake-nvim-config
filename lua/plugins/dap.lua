local dap = require('dap')
local dapui = require('dapui')

-------------------------------------------------------------------------------
-- 1. Настройка интерфейса (DAP UI)
-------------------------------------------------------------------------------
dapui.setup()

-- Автоматическое открытие/закрытие окон при старте отладки
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

-------------------------------------------------------------------------------
-- 2. Адаптер C / C++ / Rust (через CodeLLDB)
-------------------------------------------------------------------------------
-- Путь к Mason для автоматизации
local mason_path = vim.fn.stdpath("data") .. "/mason/bin/"

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = mason_path .. "codelldb",
    args = { "--port", "${port}" },
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file (CodeLLDB)",
    type = "codelldb",
    request = "launch",
    -- Автоматический поиск исполняемого файла в build/
    program = function()
      local path = vim.fn.getcwd() .. '/build/'
      return vim.fn.input('Путь к файлу: ', path, 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    -- Включает поддержку консольного ввода/вывода
    runInTerminal = true,
  },
}

-- Копируем конфиг для C и Rust
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-------------------------------------------------------------------------------
-- 3. Адаптер Python (debugpy)
-------------------------------------------------------------------------------
dap.adapters.python = {
  type = 'executable',
  command = mason_path .. "debugpy-adapter",
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      -- Поиск виртуального окружения (venv)
      local cwd = vim.fn.getcwd()
      local venvs = { '/venv/bin/python', '/.venv/bin/python', '/env/bin/python' }
      for _, v in ipairs(venvs) do
        if vim.fn.executable(cwd .. v) == 1 then return cwd .. v end
      end
      return 'python3' -- Системный python
    end,
  },
}

-------------------------------------------------------------------------------
-- 4. Горячие клавиши (Keymaps)
-------------------------------------------------------------------------------
local key = vim.keymap.set
key('n', '<F5>', dap.continue, { desc = 'DAP: Start/Continue' })
key('n', '<F10>', dap.step_over, { desc = 'DAP: Step Over' })
key('n', '<F11>', dap.step_into, { desc = 'DAP: Step Into' })
key('n', '<F12>', dap.step_out, { desc = 'DAP: Step Out' })
key('n', '<leader>b', dap.toggle_breakpoint, { desc = 'DAP: Toggle Breakpoint' })
key('n', '<leader>B', function() dap.set_breakpoint(vim.fn.input('Условие: ')) end)
key('n', '<leader>dr', dap.repl.open, { desc = 'DAP: Open REPL' })
key('n', '<leader>du', dapui.toggle, { desc = 'DAP: Toggle UI' })

-------------------------------------------------------------------------------
-- 5. Красивые иконки (Signs)
-------------------------------------------------------------------------------
vim.fn.sign_define('DapBreakpoint', { text='●', texthl='DapBreakpoint', linehl='', numhl='' })
vim.fn.sign_define('DapStopped', { text='▶', texthl='DapStopped', linehl='DebugHighlight', numhl='' })

