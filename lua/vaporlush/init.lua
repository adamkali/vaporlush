local config = require("vaporlush.config")
local M = {}
---@type {light?: string, dark?: string}
M.styles = {}

---@class Vaporlush.Global
---@field palette Vaporlush.Palette

---@param opts? Vaporlush.Config
function M.load(opts)
    opts = require("vaporlush.config").extend(opts)
    local bg = vim.o.background
    vim.o.termguicolors = true

    local colors = require("vaporlush.schemes." .. opts.style)
    ---@type Vaporlush.Global
    vim.g.Vaporlush = {
        palette = colors
    }
    require("vaporlush.groups").setup(colors, opts)
end

M.setup = config.setup

return M
