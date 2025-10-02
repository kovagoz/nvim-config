return {
  "gbprod/yanky.nvim",
  opts = {
   -- Leave this empty if no options are set
  },
  keys = {
    { "<Leader>p", "<cmd>Telescope yank_history<cr>", desc = "Yank History" },
  },
  init = function ()
    require("telescope").load_extension("yank_history")
  end,
}
