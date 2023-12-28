local opt = vim.opt

opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
