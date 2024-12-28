local M = {}

M.url = "https://github.com/echasnovski/mini.surround"

---@type trop.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniSurround = { bg = c.orange, fg = c.black },
  }
end

return M