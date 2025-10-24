return {
  "neovim/nvim-lspconfig",
  config = function ()
    local lspconfig = require('lspconfig')
    local configs = require('lspconfig.configs')

    if not configs.dockerfile_language_server then
      configs.dockerfile_language_server = {
        default_config = {
          cmd = { 'docker-langserver', '--stdio' },
          filetypes = { 'dockerfile' },
          root_dir = lspconfig.util.root_pattern('.git'),
          single_file_support = true,
        },
      }
    end

    lspconfig.dockerfile_language_server.setup({})

    vim.lsp.enable("helm_ls")
    vim.lsp.enable("intelephense")
  end
}
