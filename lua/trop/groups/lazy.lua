local M = {}

M.url = "https://github.com/folke/lazy.nvim"

---@type trop.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    LazyProgressDone = { bold = true, fg = c.accent },
    LazyProgressTodo = { bold = true, fg = c.fg_gutter },
  }
end

return M
