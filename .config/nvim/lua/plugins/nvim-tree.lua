local status, nvimtree = pcall(require, "nvim-tree")
if not status then
    return
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})

nvimtree.setup({
  view = {
    width = 40,
  },
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "▸", -- arrow when folder is closed
          arrow_open = "▾", -- arrow when folder is open
        },
      },
    },
  },
})
