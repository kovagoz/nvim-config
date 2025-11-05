return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  keys = {
    { "]h", "<cmd>Gitsigns next_hunk<CR>", desc = "Next hunk" },
    { "[h", "<cmd>Gitsigns prev_hunk<CR>", desc = "Previous hunk" },
    { "<leader>gb", "<cmd>Gitsigns blame<CR>", desc = "Git blame" },
    { "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset hunk" },
    { "<leader>gd", "<cmd>Gitsigns preview_hunk<CR>", desc = "Git diff hunk" },
  }
}
