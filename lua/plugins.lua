-- PLUGINS
--
-- See `:h :packadd`, `:h vim.pack`

-- Add the "nohlsearch" package to automatically disable search highlighting after
-- 'updatetime' and when going to insert mode.
vim.cmd('packadd! nohlsearch')

-- Install third-party plugins via "vim.pack.add()".
vim.pack.add({
  -- Quickstart configs for LSP
  'https://github.com/neovim/nvim-lspconfig',
  -- Fuzzy picker
  'https://github.com/ibhagwan/fzf-lua',
  -- Autocompletion
  'https://github.com/nvim-mini/mini.completion',
  -- Enhanced quickfix/loclist
  'https://github.com/stevearc/quicker.nvim',
  -- Git integration
  'https://github.com/lewis6991/gitsigns.nvim',
})

-------------------------------------------------------------------------------
-- PLUGIN CONFIGURATIONS
-------------------------------------------------------------------------------

-- 1. Fuzzy Finder (FZF Lua)
require('fzf-lua').setup { fzf_colors = true }

-- 2. Autocompletion (Mini Completion)
require('mini.completion').setup {}

-- 3. Quicker (Enhanced Quickfix)
require('quicker').setup {}

-- 4. Git Signs
require('gitsigns').setup {}

-- 5. Language Server Protocol (LSP Config)
-- Modern Neovim 0.11+ native LSP configuration (replaces deprecated require('lspconfig') setup)
vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua or {}, {
      runtime = {
        version = 'LuaJIT'
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      }
    })
  end,
  settings = {
    Lua = {}
  }
})

-- Enable the Lua language server
vim.lsp.enable('lua_ls')
