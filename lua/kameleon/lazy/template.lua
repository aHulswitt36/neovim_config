return
{
    'aHulswitt36/template.nvim',
    cmd = {'Template','TemProject'},
    config = function()
        require('template').setup({
            temp_dir = '~/.config/nvim/lua/kameleon/lazy/templates',
        })

        vim.keymap.set('n', '<leader>nc', function()
            vim.fn.feedkeys(":Template ")
        end, {remap = true})
    end
}
