local dap = require('dap')

-- Пример конфигурации для CodeLLDB
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb", -- Используем codelldb
    request = "launch",
    program = function()
        -- Можно автоматически определить путь к исполняемому файлу
        -- Например, если он всегда лежит в build/Debug/ или build/Release/
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    -- Здесь можно добавить настройки для отладки с CMake Tools
    -- cmake-tools.nvim может автоматически заполнить поле program
  },
}

-- Автоматический выбор конфигурации для C/C++ файлов
dap.configurations.c = dap.configurations.cpp
