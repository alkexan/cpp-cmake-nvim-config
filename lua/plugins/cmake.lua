require("cmake-tools").setup({
  cmake_command = "cmake",
  ctest_command = "ctest",
  cmake_use_presets = true,
  cmake_regenerate_on_save = false,
  cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
  cmake_build_directory = "build",
  -- cmake_compile_commands_from_lsp = false,
  cmake_compile_commands_options = {
    action = "soft_link",
  },

  -- Интеграция с отладчиком
  dap_configuration = {
    enabled = true,
    type = "codelldb",
    request = "launch",
    stopOnEntry = false,
    runInTerminal = true,
  },

  -- интеграция с ToggleTerm
  cmake_executor = {
    name = "toggleterm",
    opts = {
      direction = "horizontal",
      close_on_exit = false,
    }
  },

  cmake_runner = {
    name = "toggleterm",
    opts = {
      direction = "float",
      close_on_exit = false,
    }
  },

  -- Уведомления (Notifications)
  cmake_notifications = {
    runner = { enabled = true },
    executor = { enabled = true },
  },
})
