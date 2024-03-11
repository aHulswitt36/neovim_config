return 
{
    'anuvyklack/pretty-fold.nvim',
    config = function()
        require('pretty-fold').setup()
        require('pretty-fold').ft_setup('cs', {
            process_comment_signs = false,
            comment_signs = {
                '/**',
                '//'
            },
            matchup_patterns = {
                {'{', '}'}
            }
        })
    end
}
