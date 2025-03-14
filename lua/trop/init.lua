local config = require("trop.config")

local M = {}

---@param opts? trop.Config
function M.load(opts)
  opts = require("trop.config").extend(opts)
  vim.o.background = "dark"
  return require("trop.theme").setup(opts)
end

M.setup = config.setup

return M
