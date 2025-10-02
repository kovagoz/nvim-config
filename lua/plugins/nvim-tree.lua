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
    },
  },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
    { "<leader>fl", "<cmd>NvimTreeFindFile<CR>", desc = "Locate File" },
  },
}
