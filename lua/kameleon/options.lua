local opt = vim.opt

opt.foldmethod = 'expr'
opt.foldlevel = 9999
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
