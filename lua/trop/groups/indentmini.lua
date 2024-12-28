local M = {}

M.url = "https://github.com/nvimdev/indentmini.nvim"

---@type trop.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    IndentLine                 = { fg = c.black, nocombine = true },
    IndentLineCurrent          = { fg = c.accent, nocombine = true },
  }
end

return M
