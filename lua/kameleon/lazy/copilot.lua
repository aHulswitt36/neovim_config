return{
    {
        "github/copilot.vim"
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        opts = {
            -- See Configuration section for option
            model = "o1-preview",
            agent = "copilot",
            contexts = {
                file = {
                    input = function(callback)
                        local telescope = require("telescope.builtin")
                        local actions = require("telescope.actions")
                        local action_state = require("telescope.actions.state")
                        telescope.find_files({
                            attach_mappings = function(prompt_bufnr)
                                actions.select_default:replace(function()
                                    actions.close(prompt_bufnr)
                                    local selection = action_state.get_selected_entry()
                                    callback(selection[1])
                                end)
                                return true
                            end,
                        })
                    end,
                },
            },
        },
        keys = {
            {"<leader>cp", "<cmd>CopilotChatToggle<cr>", desc = "Copilot Chat - Toggle"},
            {"<leader>cr", "<cmd>CopilotChatReset<cr>", desc = "Copilot Chate - Reset"},
            -- {
            --     "<leader>ap",
            --     function()
            --         require("CopilotChat").select_prompt({
            --             context = {
            --                 "buffers",
            --             },
            --         })
            --     end,
            --     desc = "CopilotChat - Prompt actions",
            -- },
            -- {
            --     "<leader>ap",
            --     function()
            --         require("CopilotChat").select_prompt()
            --     end,
            --     mode = "x",
            --     desc = "CopilotChat - Prompt actions",
            -- }
        }
    },
}
