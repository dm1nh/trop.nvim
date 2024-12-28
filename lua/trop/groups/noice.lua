local M = {}

M.url = "https://github.com/folke/noice.nvim"

---@type trop.HighlightsFn
function M.get(c)
  -- stylua: ignore
  local ret = {
    NoiceCmdlineIconInput          = { fg = c.yellow },
    NoiceCmdlineIconLua            = { fg = c.accent },
    NoiceCmdlinePopupBorderInput   = { fg = c.yellow },
    NoiceCmdlinePopupBorderLua     = { fg = c.accent },
    NoiceCmdlinePopupTitleInput    = { fg = c.yellow },
    NoiceCmdlinePopupTitleLua      = { fg = c.accent },
    NoiceCompletionItemKindDefault = { fg = c.fg_dark, bg = c.none },
  }
	require("trop.groups.kinds").kinds(ret, "NoiceCompletionItemKind%s")
	return ret
end

return M
