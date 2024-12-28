local M = {}

M.url = "https://github.com/hrsh7th/nvim-cmp"

---@type trop.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    CmpDocumentation       = { fg = c.fg, bg = c.bg_float },
    CmpDocumentationBorder = { fg = c.border_highlight, bg = c.bg_float },
    CmpGhostText           = { fg = c.terminal_black },
    CmpItemAbbr            = { fg = c.fg, bg = c.none },
    CmpItemAbbrDeprecated  = { fg = c.fg_gutter, bg = c.none, strikethrough = true },
    CmpItemAbbrMatch       = { fg = c.accent, bg = c.none },
    CmpItemAbbrMatchFuzzy  = { fg = c.accent, bg = c.none },
    CmpItemKindCodeium     = { fg = c.blue, bg = c.none },
    CmpItemKindCopilot     = { fg = c.blue, bg = c.none },
    CmpItemKindSupermaven  = { fg = c.blue, bg = c.none },
    CmpItemKindDefault     = { fg = c.fg_dark, bg = c.none },
    CmpItemKindTabNine     = { fg = c.blue, bg = c.none },
    CmpItemMenu            = { fg = c.comment, bg = c.none },
  }

	require("trop.groups.kinds").kinds(ret, "CmpItemKind%s")
	return ret
end

return M
