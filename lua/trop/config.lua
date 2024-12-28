local M = {}

---@class trop.Config
M.defaults = {
	style = "medium",
	transparent = false,
	terminal_colors = true,
	dim_inactive = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
	},
	plugins = {
		all = package.loaded["lazy"] == nil,
		auto = true,
	},
	lualine_bold = true,
}

---@type trop.Config
M.options = nil

---@param options? trop.Config
function M.setup(options)
	M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

---@param opts? trop.Config
function M.extend(opts)
	return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or M.options
end

setmetatable(M, {
	__index = function(_, k)
		if k == "options" then
			return M.defaults
		end
	end,
})

return M
