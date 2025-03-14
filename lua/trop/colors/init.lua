local Util = require("trop.util")

local M = {}

---@type table<string, trop.Palette|fun(opts:trop.Config):trop.Palette>
M.styles = setmetatable({}, {
  __index = function(_, style)
    return vim.deepcopy(require("trop.colors." .. style))
  end,
})

---@param opts? trop.Config
function M.setup(opts)
  opts = require("trop.config").extend(opts)

  local palette = M.styles[opts.style]
  if type(palette) == "function" then
    palette = palette(opts)
  end

  ---@class trop.Colorscheme: trop.Palette
  local colors = palette

  Util.bg = colors.bg
  Util.fg = colors.fg

  colors.none = "NONE"
  colors.accent = colors.green

  colors.diff = {
    add = Util.blend_bg(colors.green, 0.15),
    delete = Util.blend_bg(colors.red, 0.15),
    change = Util.blend_bg(colors.orange, 0.15),
    text = colors.aqua,
  }

  colors.git = {
    add = colors.green,
    delete = colors.red,
    change = colors.orange,
    ignore = colors.dark1,
  }

  colors.black = Util.blend_bg(colors.fg_gutter, 0.65, "#000000")
  colors.border_highlight = colors.accent
  colors.border = colors.dark2

  -- Popups and Statusline
  colors.bg_popup = colors.bg_dark
  colors.bg_statusline = colors.bg_dark1

  -- Sidebar and Floats
  colors.bg_sidebar = opts.transparent and colors.none or colors.bg_dark
  colors.bg_float = opts.transparent and colors.none or colors.bg_dark

  colors.bg_visual = Util.blend_bg(colors.accent, 0.4)
  colors.bg_search = colors.accent
  colors.fg_sidebar = colors.fg_dark
  colors.fg_float = colors.fg

  -- Diagnostics
  colors.error = colors.red
  colors.warning = colors.yellow
  colors.info = colors.blue
  colors.hint = colors.aqua
  colors.todo = colors.orange

  -- Syntax
  colors.syntax = {
    field = colors.accent,
    keyword = colors.red,
    number = colors.purple,
    variable = colors.fg,
    type = colors.yellow,
    constant = colors.magenta,
    func = colors.blue,
    string = colors.aqua,
    macro = colors.red,
    annotation = colors.red,
    statement = colors.purple,
    special1 = colors.red,
    special2 = colors.orange,
    operator = colors.red,
  }

  colors.rainbow = {
    colors.blue,
    colors.yellow,
    colors.green,
    colors.aqua,
    colors.magenta,
    colors.purple,
    colors.orange,
    colors.red,
  }

  colors.terminal = {
    black = colors.black,
    black_bright = colors.terminal_black,
    red = colors.red,
    red_bright = Util.brighten(colors.red),
    green = colors.green,
    green_bright = Util.brighten(colors.green),
    yellow = colors.yellow,
    yellow_bright = Util.brighten(colors.yellow),
    blue = colors.blue,
    blue_bright = Util.brighten(colors.blue),
    magenta = colors.magenta,
    magenta_bright = Util.brighten(colors.magenta),
    cyan = colors.aqua,
    cyan_bright = Util.brighten(colors.aqua),
    white = colors.fg_dark,
    white_bright = colors.fg,
  }

  return colors, opts
end

return M
