return {
  "neovim/nvim-lspconfig",
  config = function ()
--    vim.lsp.config["helm_ls"] = {
--      filetypes = { "helm", "helm.yaml" },
--      root_markers = { "Chart.yaml" },
--      get_language_id = function ()
--        return "helm"
--      end
--    }
    vim.lsp.enable("helm_ls")
  end
}
