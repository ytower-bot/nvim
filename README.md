# Neovim Config (resumo)

Config baseada em lazy.nvim com foco em LSP, autocomplete e fuzzy finder.

## Estrutura
- `init.lua`: bootstrap do lazy.nvim e carregamento de settings/keymaps/plugins
- `lua/settings.lua`: opcoes do editor
- `lua/keymaps.lua`: atalhos globais
- `lua/plugins/`: configuracoes de plugins

## Plugins
- `42Paris/42header`: gera header padrao 42
- `nvim-treesitter/nvim-treesitter`: highlight por Treesitter
- `ellisonleao/gruvbox.nvim`: tema Gruvbox (fundo transparente)
- `hrsh7th/nvim-cmp`: autocomplete (LSP + path)
- `neovim/nvim-lspconfig`: LSP base
- `williamboman/mason.nvim`: gerencia instalacao de LSP
- `williamboman/mason-lspconfig.nvim`: integra mason com lspconfig
- `nvim-telescope/telescope.nvim`: fuzzy finder
- `nvim-telescope/telescope-fzf-native.nvim`: backend FZF nativo (se `make` existir)
- `nvim-telescope/telescope-ui-select.nvim`: UI select para Telescope
- `nvim-lua/plenary.nvim`: dependencias do Telescope
- `nvim-tree/nvim-web-devicons`: icones

## Settings principais
- `number` e `relativenumber`
- `tabstop = 4`, `shiftwidth = 4`
- `undofile = true`
- `mouse = a`
- `listchars = { tab = '» ', space = '·' }`

## Atalhos globais
- `<leader>` = espaco
- `<Esc>`: limpar highlight de busca
- `<leader>e`: abrir explorer (`:Ex`)
- `<leader>tl`: alternar whitespaces (`:set list!`)

## Atalhos do Telescope
- `<leader>fb`: buffers
- `<leader>fd`: diagnosticos
- `<leader>ff`: arquivos
- `<leader>fg`: live grep
- `<leader>fp`: arquivos recentes
- `<leader>fr`: retomar ultima busca

## Atalhos do LSP (quando anexado)
- `gd`: definicao
- `gD`: declaracao
- `gi`: implementacao
- `gr`: referencias
- `gt`: definicao de tipo
- `<leader>r`: rename
- `<leader>ca`: code action
- `<leader>ds`: simbolos do documento
- `<leader>ws`: simbolos do workspace
- `<leader>th`: toggle inlay hints (se suportado)

## Atalhos do nvim-cmp (Insert)
- `<C-p>`: anterior
- `<C-n>`: proximo
- `<C-b>` / `<C-f>`: scroll docs
- `<C-c>`: cancelar
- `<C-a>`: confirmar
- `<C-s>`: abrir menu
