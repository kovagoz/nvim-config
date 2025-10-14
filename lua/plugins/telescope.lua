return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function ()
    require("telescope").setup({
      pickers = {
        find_files = {
          previewer = false,
          height = 0.6,
          disable_devicons = true,
        },
        oldfiles = {
          previewer = false,
          height = 0.6,
          disable_devicons = true,
        },
        live_grep = {
          disable_devicons = true,
          layout_strategy = "vertical",
          layout_config = {
            height = { padding = 0 },
            width = { padding = 0 },
            preview_height = 0.5,
            preview_cutoff = 15 -- hide preview is thinner than 15 chars
          },
        },
        buffers = {
          disable_devicons = true,
          previewer = false,
          ignore_current_buffer = true,
          layout_config = {
            height = 0.50,
            width = 0.70,
          }
        },
        git_status = {
          disable_devicons = true,
          layout_strategy = "vertical",
          layout_config = {
            height = { padding = 0 },
            width = { padding = 0 },
            preview_height = 0.5,
            preview_cutoff = 15,
          }
        },
      },
    })
  end,
  keys = {
--    { "<Leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
--    { "<Leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<Leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Previously open files" },
    { "<Tab>", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<Leader>gf", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
  },
}
