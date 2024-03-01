return {
    'rmagatti/goto-preview',
    config = function()
        require('goto-preview').setup {}
        vim.keymap.set('n', '<leader>gd','<cmd>lua require("goto-preview").goto_preview_definition()<CR>', {noremap=true})
        vim.keymap.set('n', '<leader>gt','<cmd>lua require("goto-preview").goto_preview_type_definition()<CR>',{noremap=true})
        vim.keymap.set('n', '<leader>gi','<cmd>lua require("goto-preview").goto_preview_implementation()<CR>',{noremap=true})
        vim.keymap.set('n', '<leader>gD','<cmd>lua require("goto-preview").goto_preview_declaration()<CR>', {noremap=true})
        vim.keymap.set('n', '<leader>gc','<cmd>lua require("goto-preview").close_all_win()<CR>',{noremap=true})
    end
}
