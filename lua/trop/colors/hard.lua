local ret = vim.deepcopy(require("trop.colors.medium"))

---@type trop.Palette
return vim.tbl_deep_extend("force", ret, {
  bg = "#202529",
  bg_dark = "#1c2024",
  bg_dark1 = "#181c1f",
  bg_highlight = "#272d32",
})
