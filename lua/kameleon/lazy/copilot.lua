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
        -- See Commands section for default commands if you want to lazy load on them
        -- config = function(_, opts)
        --     local chat = require("CopilotChat")
        --     chat.setup(opts)
        --
        --     vim.keymap.set({ "v", "n" }, "<leader>cp", chat.toggle())
        --     vim.keymap.set({ "v", "n" }, "<leader>cP", chat.open({
        --         window = {
        --             layout = "float",
        --             title = "CoPilot"
        --         }
        --     }))
        -- end
        keys = {  
            {"<leader>cp", "<cmd>CopilotChatToggle<cr>", desc = "Copilot Chat - Toggle"},
            {"<leader>cr", "<cmd>CopilotChatReset<cr>", desc = "Copilot Chate - Reset"}
        }
    },
}
