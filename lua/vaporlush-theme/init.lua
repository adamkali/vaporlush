local config = require("vaporlush.config")

local M = {}
---@type {light?: string, dark?: string}
M.styles = {}

---@param opts? Vaporlush.Config
function M.load(opts)
  opts = require("vaporlush.config").extend(opts)
  local bg = vim.o.background

  local style_bg = opts.style == "day" and "light" or "dark"

  if bg ~= style_bg then
    if vim.g.colors_name == "vaporlush-" .. opts.style then
      opts.style = bg == "light" and (M.styles.light or "day") or (M.styles.dark or "moon")
    else
      vim.o.background = style_bg
    end
  end
  M.styles[vim.o.background] = opts.style
  return require("vaporlush.theme").setup(opts)
end

M.setup = config.setup

return M
