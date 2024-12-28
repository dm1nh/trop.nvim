local M = {}

M.url = "https://github.com/lukas-reineke/indent-blankline.nvim"

---@type trop.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    IndentBlanklineChar        = { fg = c.black, nocombine = true },
    IndentBlanklineContextChar = { fg = c.accent, nocombine = true },
    IblIndent                  = { fg = c.black, nocombine = true },
    IblScope                   = { fg = c.accent, nocombine = true },
  }
end

return M
