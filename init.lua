local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.lsp.util._str_utfindex_enc then
  vim.lsp.util._str_utfindex_enc = function(str, col, enc)
    return vim.str_utfindex(str, col, enc)
  end
end
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('keymaps')
require('settings')

local plugins = {
	'42Paris/42header',
	{
		'nvim-treesitter/nvim-treesitter', -- Syntax highlighting, edit and indent
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.config').setup({
				highlight = {
					enable = true,
				},
			})
		end,
	},

    {
		'ellisonleao/gruvbox.nvim', -- Colorscheme
		priority = 9999, -- Make sure to load this before all the other start plugins
		init = function()
			vim.cmd.colorscheme('gruvbox')
			-- Transparent background
			vim.cmd('hi normal guibg=none')
		end,
	},

	require('plugins.nvim-cmp'), -- Autocomplete
	require('plugins.nvim-lspconfig'), -- LSP
	require('plugins.telescope'), -- Fuzzy finder
}

local opts = {}

require('lazy').setup(plugins, opts)
