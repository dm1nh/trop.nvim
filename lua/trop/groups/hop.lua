local Util = require("trop.util")

local M = {}

M.url = "https://github.com/phaazon/hop.nvim"

---@type trop.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    HopNextKey = { fg = c.aqua, bold = true },
    HopNextKey1 = { fg = c.accent, bold = true },
    HopNextKey2 = { fg = Util.blend_bg(c.accent, 0.6) },
    HopUnmatched = { fg = c.fg_dark1 },
  }
end

return M
