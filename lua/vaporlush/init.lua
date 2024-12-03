local config = require("vaporlush.config")


local M = {}
---@type {light?: string, dark?: string}
M.styles = {}

---@param opts? Vaporlush.Config
function M.load(opts)
  opts = require("vaporlush.config").extend(opts)
  local bg = vim.o.background
  local style_bg = opts.style == "day" and "light" or "dark"
  vim.o.termguicolors = true

  local colors = require("vaporlush.schemes." .. opts.style)
  require("vaporlush.groups").setup(colors, opts)
end

M.setup = config.setup

return M
