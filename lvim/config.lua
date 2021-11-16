--[[
lvim is the global options object
Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

-- Plugins
lvim.plugins = {
  {"fatih/vim-go"},
  {"folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
    end,
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = {"fugitive"}
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "folke/persistence.nvim",
      event = "VimEnter",
      module = "persistence",
      config = function()
        require("persistence").setup {
          dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
          options = { "buffers", "curdir", "tabpages", "winsize" },
        }
    end,
  },
  {"folke/tokyonight.nvim"}, {
           "ray-x/lsp_signature.nvim",
           config = function() require"lsp_signature".on_attach() end,
           event = "InsertEnter"
  },
  {
    "folke/trouble.nvim",
      cmd = "TroubleToggle",
  },
  {
    "filipdutescu/renamer.nvim",
      branch = 'master',
      requires = { {'nvim-lua/plenary.nvim'} },
      config = function()
        require("renamer").setup {
          title = '+×',
          show_refs = true,
          padding = {
            top = 0,
            bottom = 0,
            left = 0,
            right = 0,
          },
      }
      end,
  },
  {
    'wfxr/minimap.vim',
    run = "cargo install --locked code-minimap",
    cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
    config = function ()
      vim.cmd ("let g:minimap_width = 10")
      vim.cmd ("let g:minimap_auto_start = 1")
      vim.cmd ("let g:minimap_auto_start_win_enter = 1")
    end,
  },
}

-- My own config
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.colorcolumn = "99999" -- fixes indentline for now
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showtabline = 2 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.title = true -- set the title of window to the value of the titlestring
-- vim.opt.titlestring = "%<%F%=%l/%L - LunarVim" -- what the title of the window will be set to
vim.opt.titlestring = "LunarVim" -- what the title of the window will be set to
-- vim.opt.undodir = "~/.config/lvim/undo" -- set an undo directory
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = false -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
vim.opt.wrap = true -- display lines as one long line
vim.opt.spelllang = "en"
vim.opt.spell = false
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8

lvim.builtin.nvimtree.quit_on_open = 1
lvim.builtin.lualine.style = "default"
lvim.lsp.diagnostics.virtual_text = true

lvim.builtin.dashboard.custom_header = {
"      +++++++       xxxxxxx      xxxxxxx",
"      +:::::+        x:::::x    x:::::x ",
"      +:::::+         x:::::x  x:::::x  ",
"+++++++:::::+++++++    x:::::xx:::::x   ",
"+:::::::::::::::::+     x::::::::::x    ",
"+:::::::::::::::::+     x::::::::::x    ",
"+++++++:::::+++++++    x:::::xx:::::x   ",
"      +:::::+         x:::::x  x:::::x  ",
"      +:::::+        x:::::x    x:::::x ",
"      +++++++       xxxxxxx      xxxxxxx",
}

local status = {
  ["NORMAL"]  = "am very normal :)",
  ["INSERT"]  = " inserting shit  ",
  ["COMMAND"] = " i command thee  ",
  ["VISUAL"]  = "   soo visual    ",
  ["V-LINE"]  = "very visual line ",
  ["V-BLOCK"] = "very visual block",
  ["REPLACE"] = " replacing stuff ",
  ["SELECT"]  = " selecting stuff ",
}

lvim.builtin.lualine.sections.lualine_a = {
{
    "mode",
    fmt = function(mode)
          -- local status_val = status[mode]
          -- if status_val == nil then
          --   return mode
          -- end
          return status[mode]
     end
  },
}

lvim.builtin.bufferline.options = {
      numbers = "ordinal",
      view = "multiwindow",
      number = "superscript",
      modified_icon = '●',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 18,
      max_prefix_length = 25, -- prefix used when a buffer is deduplicated
      tab_size = 20,
      diagnostics ="nvim_lsp",
      show_buffer_close_icons = false,
      show_close_icon = false,
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and "" or ""
        return " " .. icon .. count
      end,
      separator_style = "thin",
}

lvim.builtin.lualine.options.theme = "tokyonight"

lvim.builtin.which_key.mappings["f"] = { "<cmd>Telescope live_grep<CR>", "Find In Folder" }
lvim.builtin.which_key.mappings["m"] = { "<cmd>MinimapToggle<CR>", "Toggle Minimap" }
-- lvim.builtin.which_key.mappings["r"] = { "<cmd>RnvimrToggle<CR>", "Ranger File Navigator" }

lvim.builtin.which_key.mappings["a"] = {"<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" }

lvim.builtin.which_key.mappings["h"] = {
  name = "Hop",
  l = { "<cmd>HopLine<cr>", "Hop to Line" },
  w = { "<cmd>HopWord<cr>", "Hop to Word" },
  c = { "<cmd>HopChar1<cr>", "Hop to Character" }
}

lvim.builtin.which_key.mappings["T"] = {
  name = "Trouble Diagnostics",
  t = { "<cmd>TodoTelescope<cr>", "Toggle Todo Telescope Menu" },
  T = { "<cmd>TodoTrouble<cr>", "Toggle Todo Trouble Menu" },
  w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Workspace" },
  d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "Show Quickfix(s)" },
  l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
}
lvim.builtin.which_key.mappings["t"] = {"<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Toggle Trouble Diagnostics" }


lvim.builtin.which_key.mappings["l"]["r"] = {"<cmd>lua require('renamer').rename{empty=true,}<cr>", "Rename"}

lvim.transparent_window = true

vim.api.nvim_set_keymap('', '<up>', '<nop>',{ noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<down>', '<nop>',{ noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<left>', '<nop>',{ noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<right>', '<nop>',{ noremap = true, silent = true})

lvim.keys.normal_mode["gh"] = "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false, border = 'single' })<CR>"

-- general
lvim.log.level = "warn"

lvim.format_on_save = true
lvim.lint_on_save = true

lvim.colorscheme = "tokyonight"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
-- }

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
-- lvim.builtin.dap.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup {
  -- {
  --   exe = "prettier",
  --   filetypes = {"typescript", "javascript", "html", "css", "json"},
  --   args = {}
  -- },
  {
    exe = "black",
    filetypes = {"python"},
    args = {}
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    exe = "flake8",
    filetypes = {"python"}
  },
}
