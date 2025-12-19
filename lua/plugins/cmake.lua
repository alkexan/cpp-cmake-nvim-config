require("cmake-tools").setup({
    cmake_command = "cmake",
    ctest_command = "ctest",
    cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- Генерирует compile_commands.json
    cmake_build_directory = "build", -- Стандартная директория сборки
    cmake_compile_commands_options = {
        action = "soft_link", -- Создает симлинк в корень проекта для LSP
        target = vim.fn.getcwd(),
    },
    -- Интеграция с отладчиком
    dap_configuration = {
        enabled = true,
        -- Дополнительные настройки отладчика, если нужны
    },
})
