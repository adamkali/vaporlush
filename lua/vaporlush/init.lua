local config = require("vaporlush.config")
local util  = require("vaporlush.util")
local M = {}
---@type {light?: string, dark?: string}
M.styles = {}

---@class Vaporlush.Global
---@field palette Vaporlush.Palette
---@field style string

---@param opts? Vaporlush.Config
function M.load(opts)
    opts = require("vaporlush.config").extend(opts)
    local bg = vim.o.background

    local colors = require("vaporlush.schemes." .. opts.style)
    local groups = require("vaporlush.groups").setup(colors, opts)
    vim.o.termguicolors = true
    vim.g.colors_name = "tokyonight-" .. opts.style

    for group, hl in pairs(groups) do
        hl = type(hl) == "string" and { link = hl } or hl
        vim.api.nvim_set_hl(0, group, hl)
    end
    ---@type Vaporlush.Global
    vim.g.Vaporlush = {
        palette = colors,
        style = opts.style,
        lualine = util.lualine(colors)
    }

    --if opts.terminal_colors then
    --    M.terminal(colors)
    --end

    return colors, groups, opts
end

---@param colors ColorScheme
function M.terminal(colors)
  -- dark
  vim.g.terminal_color_0 = colors.terminal.black
  vim.g.terminal_color_8 = colors.terminal.black_bright

  -- light
  vim.g.terminal_color_7 = colors.terminal.white
  vim.g.terminal_color_15 = colors.terminal.white_bright

  -- colors
  vim.g.terminal_color_1 = colors.terminal.red
  vim.g.terminal_color_9 = colors.terminal.red_bright

  vim.g.terminal_color_2 = colors.terminal.green
  vim.g.terminal_color_10 = colors.terminal.green_bright

  vim.g.terminal_color_3 = colors.terminal.yellow
  vim.g.terminal_color_11 = colors.terminal.yellow_bright

  vim.g.terminal_color_4 = colors.terminal.blue
  vim.g.terminal_color_12 = colors.terminal.blue_bright

  vim.g.terminal_color_5 = colors.terminal.magenta
  vim.g.terminal_color_13 = colors.terminal.magenta_bright

  vim.g.terminal_color_6 = colors.terminal.cyan
  vim.g.terminal_color_14 = colors.terminal.cyan_bright
end

M.setup = config.setup

return M
