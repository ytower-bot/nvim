local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
	{
		'nvim-treesitter/nvim-treesitter', -- Syntax highlighting, edit and indent
		build = ':TSUpdate',
	},

    {
		'rebelot/kanagawa.nvim', -- Colorscheme
		priority = 9999, -- Make sure to load this before all the other start plugins
		init = function()
			vim.cmd.colorscheme('kanagawa')
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

