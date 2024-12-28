local ret = vim.deepcopy(require("trop.colors.medium"))

---@type trop.Palette
return vim.tbl_deep_extend("force", ret, {
	bg = "#272e33",
	bg_dark = "#242b2f",
	bg_dark1 = "#20262a",
	bg_highlight = "#2e363c",
})
