return
{
    'anuvyklack/fold-preview.nvim',
    dependencies = {
        'anuvyklack/keymap-amend.nvim'
    },
    config = function()
        require('fold-preview').setup({
            -- Your configuration goes here.
        })
    end
}
