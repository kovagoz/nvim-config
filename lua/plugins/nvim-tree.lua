return {
  "nvim-tree/nvim-tree.lua",
  version = "*", -- use latest
  lazy = false,
  opts = {
    sort_by = "case_sensitive",
    view = {
      width = 45,
    },
    renderer = {
      group_empty = true,
      icons = {
        show = {
          file = false,
          folder = false,
          folder_arrow = true,
        },
      },
    },
    filters = {
      dotfiles = false,
      git_ignored = false,
    },
    on_attach = function(bufnr)
      local api = require('nvim-tree.api')
      
      -- Default mappings
      api.config.mappings.default_on_attach(bufnr)
      
      -- Custom mapping for ENTER: open file and close nvim-tree
      vim.keymap.set('n', '<CR>', function()
        local node = api.tree.get_node_under_cursor()

        if node and node.type == 'file' then
          api.node.open.edit()
          api.tree.close()
        else
          api.node.open.edit()
        end
      end, { buffer = bufnr, noremap = true, silent = true, desc = 'Open and close tree' })
      
      -- The 'o' key will use default behavior (opens but doesn't close tree)
      vim.keymap.set('n', 'o', function()
        local node = api.tree.get_node_under_cursor()

        if node and node.type == 'directory' then
          vim.cmd('normal! zz')
        end

        api.node.open.edit()
      end, { buffer = bufnr, noremap = true, silent = true, desc = 'Open' })
    end,
  },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
    { "<leader>fl", "<cmd>NvimTreeFindFile<CR>", desc = "Locate File" },
  },
}
