return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = function ()
    return {
      sections = { lualine_b = { 'branch' } }
    }
  end
}
