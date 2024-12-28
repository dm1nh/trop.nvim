---@class trop.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias trop.Highlights table<string,trop.Highlight|string>

---@alias trop.HighlightsFn fun(colors: trop.Colorscheme, opts:trop.Config):trop.Highlights
