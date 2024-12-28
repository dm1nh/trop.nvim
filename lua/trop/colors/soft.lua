local ret = vim.deepcopy(require("trop.colors.medium"))

---@type trop.Palette
return vim.tbl_deep_extend("force", ret, {
  bg = "#2d353b",
  bg_dark = "#272e33",
  bg_dark1 = "#22282c",
  bg_highlight = "#343d44",
})
