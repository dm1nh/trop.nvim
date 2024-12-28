local M = {}

M.url = "https://github.com/echasnovski/mini.map"

---@type trop.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniMapNormal      = "NormalFloat",
    MiniMapSymbolCount = "Special",
    MiniMapSymbolLine  = "Title",
    MiniMapSymbolView  = "Delimiter",
  }
end

return M
