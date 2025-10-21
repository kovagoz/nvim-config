return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  keys = {
    { "<leader>gs", "<cmd>Neogit<CR>", desc = "Open Neogit" },
    { "<leader>gP", function ()
        require('neogit').action('push', 'to_pushremote', {})()
      end, desc = "Git push"
    },
    { "<leader>gp", function ()
        require('neogit').action('pull', 'from_pushremote', {})()
      end, desc = "Git pull" },
  }
}
