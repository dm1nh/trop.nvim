local M = {}

M.url = "https://github.com/folke/which-key.nvim"

---@type trop.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    WhichKey          = { fg = c.aqua },
    WhichKeyGroup     = { fg = c.accent },
    WhichKeyDesc      = { fg = c.blue },
    WhichKeySeparator = { fg = c.comment },
    WhichKeyNormal     = { bg = c.bg_sidebar },
    WhichKeyValue     = { fg = c.dark2 },
  }
end

return M
