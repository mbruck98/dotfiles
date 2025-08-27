require "nvchad.mappings"

local map = vim.keymap.set

map('n', '<Leader>dr', function() require('dap').continue() end, { desc = "Debug: Start or continue the debugger" })
map('n', '<Leader>dSo', function() require('dap').step_over() end, { desc = "Debug: Step over" })
map('n', '<Leader>dSi', function() require('dap').step_into() end, { desc = "Debug: Step into" })
map('n', '<Leader>dSou', function() require('dap').step_out() end, { desc = "Debug: Step out" })
map('n', '<Leader>db', function() require('dap').toggle_breakpoint() end, { desc = "Debug: Toggle breakpoint" })
map('n', '<Leader>dB', function() require('dap').set_breakpoint() end, { desc = "Debug: Set breakpoint" })
map({'n', 'v'}, '<Leader>dh', function() require('dap.ui.widgets').hover() end, { desc= "Debug: Hover" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("i", "<C-x>", "<ESC>")
