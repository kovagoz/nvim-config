return {
  "neovim/nvim-lspconfig",
  config = function ()
    vim.lsp.enable("helm_ls")
  end
}
