return
{
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "xiyaowong/transparent.nvim"
    },

    {
        "nvim-neotest/nvim-nio"
    },

    {
  	    "nvim-treesitter/nvim-treesitter",
      	opts =
        {
  		    ensure_installed =
            {
                "vim", "lua", "vimdoc",
                "html", "css", "cpp", "c",
                "python","cmake", "bash",
                "awk", "doxygen"
            },
        },
    },

    {
        "mfussenegger/nvim-dap",
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies =
        {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end
    },

    {
	    "lewis6991/hover.nvim",
    },

}
