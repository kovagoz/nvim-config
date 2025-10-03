return {
  "gbprod/yanky.nvim",
  opts = {
   -- Leave this empty if no options are set
  },
  config = function ()
    require("yanky").setup({})
    require("telescope").load_extension("yank_history")

    local mapping = require("yanky.telescope.mapping")
    local actions = require("telescope.actions")

    -- Paste after the current line
    vim.keymap.set("n", "<leader>p", function()
      require("telescope").extensions.yank_history.yank_history()
    end)

    -- Paste before the current line
    vim.keymap.set("n", "<leader>P", function()
      require("telescope").extensions.yank_history.yank_history({
        attach_mappings = function (_, map)
          actions.select_default:replace(mapping.put("P"))
          return true
        end
      })
    end)
  end,
}
