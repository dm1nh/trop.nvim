local M = {}

M.url = "https://github.com/MagicDuck/grug-far.nvim"

---@type trop.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    GrugFarHelpHeader             = { fg = c.comment },
    GrugFarHelpHeaderKey          = { fg = c.aqua },
    GrugFarInputLabel             = { fg = c.accent },
    GrugFarInputPlaceholder       = { fg = c.fg_dark1 },
    GrugFarResultsChangeIndicator = { fg = c.git.change },
    GrugFarResultsHeader          = { fg = c.orange },
    GrugFarResultsLineColumn      = { fg = c.fg_dark1 },
    GrugFarResultsLineNo          = { fg = c.fg_dark1 },
    GrugFarResultsMatch           = { fg = c.black, bg = c.red },
    GrugFarResultsStats           = { fg = c.blue },
  }
end

return M
