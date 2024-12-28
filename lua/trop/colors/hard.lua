local ret = vim.deepcopy(require("trop.colors.medium"))

---@type trop.Palette
return vim.tbl_deep_extend("force", ret, {
	bg = "#202529",
	bg_dark = "#1e2226",
	bg_dark1 = "#1a1f22",
	bg_highlight = "#272d32",
})
