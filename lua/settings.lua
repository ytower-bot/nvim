vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4

vim.opt.undofile = true

vim.opt.mouse = 'a'

-- Visual whitespaces
vim.opt.listchars = { tab = '» ', space = '·' }

-- Format with :F
-- vim.cmd('command! F :lua vim.lsp.buf.format()')

-- Format and save with :W
-- vim.cmd('command! W :exec "F" | w')
