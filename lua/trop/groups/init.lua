local Util = require("trop.util")

local M = {}

M.plugins = {
	["gitsigns.nvim"] = "gitsigns",
	["grug-far.nvim"] = "grug_far",
	["hop.nvim"] = "hop",
	["indent-blankline.nvim"] = "indent_blankline",
	["indentmini.nvim"] = "indentmini",
	["lazy.nvim"] = "lazy",
	["mini.animate"] = "mini_animate",
	["mini.clue"] = "mini_clue",
	["mini.completion"] = "mini_completion",
	["mini.cursorword"] = "mini_cursorword",
	["mini.deps"] = "mini_deps",
	["mini.diff"] = "mini_diff",
	["mini.files"] = "mini_files",
	["mini.hipatterns"] = "mini_hipatterns",
	["mini.icons"] = "mini_icons",
	["mini.indentscope"] = "mini_indentscope",
	["mini.jump"] = "mini_jump",
	["mini.map"] = "mini_map",
	["mini.notify"] = "mini_notify",
	["mini.operators"] = "mini_operators",
	["mini.pick"] = "mini_pick",
	["mini.starter"] = "mini_starter",
	["mini.statusline"] = "mini_statusline",
	["mini.surround"] = "mini_surround",
	["mini.tabline"] = "mini_tabline",
	["mini.test"] = "mini_test",
	["mini.trailspace"] = "mini_trailspace",
	["neo-tree.nvim"] = "neo_tree",
	["noice.nvim"] = "noice",
	["nvim-cmp"] = "cmp",
	["nvim-dap"] = "dap",
	["nvim-notify"] = "notify",
	["nvim-treesitter-context"] = "treesitter_context",
	["rainbow-delimiters.nvim"] = "rainbow",
	["snacks.nvim"] = "snacks",
	["telescope.nvim"] = "telescope",
	["trouble.nvim"] = "trouble",
	["which-key.nvim"] = "which_key",
}

function M.get_group(name)
	---@type {get: trop.HighlightsFn, url: string}
	return require("trop.groups." .. name)
end

---@param colors trop.Colorscheme
---@param opts trop.Config
function M.get(name, colors, opts)
	local mod = M.get_group(name)
	return mod.get(colors, opts)
end

---@param colors trop.Colorscheme
---@param opts trop.Config
function M.setup(colors, opts)
	local groups = {
		base = true,
		kinds = true,
		sematic_tokens = true,
		treesitter = true,
	}

	if opts.plugins.all then
		for _, group in pairs(M.plugins) do
			groups[group] = true
		end
	elseif opts.plugins.auto and package.loaded["lazy"] then
		local plugins = require("lazy.core.config").plugins
		for plugin, group in pairs(M.plugins) do
			if plugins[plugin] then
				groups[group] = true
			end
		end

		if plugins["mini.nvim"] then
			for _, group in pairs(M.plugins) do
				if group:find("^mini_") then
					groups[group] = true
				end
			end
		end
	end

	-- manually enable/disable plugins
	for plugin, group in pairs(M.plugins) do
		local use = opts.plugins[group]
		use = use == nil and opts.plugins[plugin] or use
		if use ~= nil then
			if type(use) == "table" then
				use = use.enabled
			end
			groups[group] = use or nil
		end
	end

	local names = vim.tbl_keys(groups)
	table.sort(names)

	local ret = {}
	for group in pairs(groups) do
		for k, v in pairs(M.get(group, colors, opts)) do
			ret[k] = v
		end
	end
	Util.resolve(ret)

	return ret, groups
end

return M
