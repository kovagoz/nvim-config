vim.opt.listchars = 'eol:$,tab:>-,trail:~,extends:>,precedes:<,space:·'
vim.opt.mouse = 'a'
vim.opt.splitbelow = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 3
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.list = true
vim.opt.cc = "80"

-- Default indentation is 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.bo.softtabstop = 4

-- Set proper file type for .env files
vim.filetype.add({
  extension = {
    env = "sh",
  },
  filename = {
    [".env"] = "sh",
  },
  pattern = {
    ["%.env%.[%w_.-]+"] = "sh",
  },
})

require("config.lazy")

vim.api.nvim_set_hl(0, "NonText", { fg="#51576d" })

vim.keymap.set('n', '<space>', ':nohlsearch<Bar>:echo<CR>', { silent = true })

-- Copy the selected line(s) to the system clipboard
vim.keymap.set('v', 'Y', '"*y')

-- Close the current buffer
vim.keymap.set('n', '<leader>x', ':bd<CR>')

-- Close all buffers
vim.keymap.set('n', '<leader>X', ':bufdo bd<CR>')

-- Comments
vim.keymap.set('n', '<leader>/', 'gcc', { remap = true })
vim.keymap.set('v', '<leader>/', 'gc', { remap = true })

-- Navigation between next and previous buffers (breadcrumb)
vim.keymap.set('n', '<Left>', ':bp<CR>')
vim.keymap.set('n', '<Right>', ':bn<CR>')

-- Window actions
vim.keymap.set('n', '<leader>ww', '<C-w>w')
vim.keymap.set('n', '<leader>wc', '<C-w>c')

-- File search in the whole project or in the selected folder in nvim-tree
vim.keymap.set("n", "<leader>ff", function()
  local tb = require("telescope.builtin")
  local ft = vim.bo.filetype

  if ft == "NvimTree" then
    -- -- get folder under cursor in nvim-tree
    local api = require("nvim-tree.api")
    local node = api.tree.get_node_under_cursor()

    if node then
      if node.type == "directory" then
        path = node.absolute_path
      else
        path = vim.fn.fnamemodify(node.absolute_path, ":h")
      end
    end

    if path then
      tb.find_files({ cwd = path })
    else
      vim.notify("No node under cursor", vim.log.levels.WARN)
    end
  else
    -- default: search whole project
    tb.find_files()
  end
end)
