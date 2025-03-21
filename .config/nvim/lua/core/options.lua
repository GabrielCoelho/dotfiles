-- Opções do editor
local opt = vim.opt

-- UI
opt.number = true               -- Mostra números de linha
opt.relativenumber = true       -- Mostra números de linha relativos
opt.cursorline = true           -- Destaca a linha do cursor
opt.cursorlineopt = "both"      -- Destaca tanto o número quanto a linha
opt.showmatch = true            -- Destaca parênteses correspondentes
opt.termguicolors = true        -- Cores true color
opt.signcolumn = "yes"          -- Sempre mostra a coluna de sinais
opt.scrolloff = 8               -- Manter 8 linhas ao rolar
opt.sidescrolloff = 8           -- Manter 8 colunas ao rolar horizontalmente
opt.splitbelow = true           -- Divide horizontal abaixo
opt.splitright = true           -- Divide vertical à direita
opt.conceallevel = 2            -- Esconde marcadores em markdown (útil para Obsidian)

-- Edição
opt.expandtab = true            -- Usa espaços em vez de tabs
opt.shiftwidth = 2              -- Largura da indentação
opt.tabstop = 2                 -- Largura do tab
opt.smartindent = true          -- Indentação inteligente
opt.wrap = false                -- Sem quebra de linha
opt.undofile = true             -- Persistência de undo
opt.clipboard = "unnamedplus"   -- Usa o clipboard do sistema

-- Busca
opt.ignorecase = true           -- Ignora case em buscas
opt.smartcase = true            -- Sensível a case se houver maiúsculas
opt.hlsearch = true             -- Destaca resultados de busca
opt.incsearch = true            -- Busca incremental

-- Desempenho
opt.updatetime = 300            -- Tempo para atualização
opt.timeout = true
opt.timeoutlen = 500            -- Tempo para processar comandos

-- Completar
opt.completeopt = { "menuone", "noselect", "noinsert" }
opt.shortmess = opt.shortmess + { c = true }

-- Arquivos temporários
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Interface
opt.guifont = "MonaspiceXe :h12"
