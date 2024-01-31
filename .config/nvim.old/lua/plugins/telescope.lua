local setup, telescope = pcall(require, "telescope")
if not setup then
  return
end

telescope.setup({
  defaults = {
    sort_lastused = true,
    ignore_current_buffer = true,
    file_ignore_patterns = {
      "node_modules"
    }
  }
})
