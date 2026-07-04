local config = require("vaporlush.config")
local util  = require("vaporlush.util")
local M = {}
---@type {light?: string, dark?: string}
M.styles = {}

--- A group of four shades, brightest-last (matches the v1 API).
---@class Vaporlush.Shades
---@field shade0 string darkest
---@field shade1 string
---@field shade2 string
---@field shade3 string lightest

--- The public color object for the currently loaded scheme, returned by
--- `require("vaporlush").get()` and `vim.g.Vaporlush:get()`. Exposes the raw flat
--- palette (bg/fg/primary0../gitsigns/..), v1-style grouped shades, and the style.
---@class Vaporlush.Colors : Vaporlush.Palette
---@field style string the active style name (e.g. "vapor")
---@field palette Vaporlush.Palette the raw palette table
---@field Primary Vaporlush.Shades
---@field Secondary Vaporlush.Shades
---@field Tertiary Vaporlush.Shades
---@field Quartary Vaporlush.Shades

---@class Vaporlush.Global
---@field palette Vaporlush.Palette
---@field style string
---@field lualine table
---@field get fun():Vaporlush.Colors

--- Build the public color object from a raw palette.
---@param c Vaporlush.Palette
---@param style string
---@return Vaporlush.Colors
local function build_colors(c, style)
    -- start from the raw flat palette so `get().primary2`, `get().gitsigns` work,
    -- then layer on the grouped v1-style accessors and metadata.
    return vim.tbl_extend("force", {}, c, {
        style     = style,
        palette   = c,
        Primary   = { shade0 = c.primary0,   shade1 = c.primary1,   shade2 = c.primary2,   shade3 = c.primary3 },
        Secondary = { shade0 = c.secondary0, shade1 = c.secondary1, shade2 = c.secondary2, shade3 = c.secondary3 },
        Tertiary  = { shade0 = c.tertiary0,  shade1 = c.tertiary1,  shade2 = c.tertiary2,  shade3 = c.tertiary3 },
        Quartary  = { shade0 = c.quartary0,  shade1 = c.quartary1,  shade2 = c.quartary2,  shade3 = c.quartary3 },
    })
end

---@type Vaporlush.Colors? colors for the currently loaded scheme
M._colors = nil

--- Get the colors of the currently loaded scheme. Falls back to the configured
--- default style if the theme hasn't been loaded yet.
--- Also callable as `vim.g.Vaporlush:get()`.
---@return Vaporlush.Colors
function M.get()
    if not M._colors then
        local style = require("vaporlush.config").options.style or "vapor"
        M._colors = build_colors(require("vaporlush.schemes." .. style), style)
    end
    return M._colors
end

---@param opts? Vaporlush.Config
function M.load(opts)
    opts = require("vaporlush.config").extend(opts)

    local colors = require("vaporlush.schemes." .. opts.style)
    local base_colors = require("vaporlush.schemes")

    -- Process background option
    if opts.background == "dark" then
        colors.bg = base_colors.background_dark
        -- Lighten for dark bg: blend 10% white into the dark background
        colors.bg_highlight = util.blend("#ffffff", 0.1, colors.bg)
    elseif opts.background == "light" then
        colors.bg = base_colors.background_light
        -- Darken for light bg: blend 10% black into the light background
        colors.bg_highlight = util.blend("#000000", 0.1, colors.bg)
    end
    -- "default" keeps scheme's original bg and bg_highlight

    local groups = require("vaporlush.groups").setup(colors, opts)
    local lualine = require('vaporlush.schemes.lualine-'.. opts.style)

    vim.o.termguicolors = true
    vim.g.colors_name = "vaporlush-" .. opts.style

    for group, hl in pairs(groups) do
        hl = type(hl) == "string" and { link = hl } or hl
        vim.api.nvim_set_hl(0, group, hl)
    end

    M._colors = build_colors(colors, opts.style)

    ---@type Vaporlush.Global
    vim.g.Vaporlush = {
        palette = colors,
        style = opts.style,
        lualine = lualine,
        -- closes over M._colors so `vim.g.Vaporlush:get()` returns the live object
        -- (self is ignored, so both `:get()` and `.get()` work)
        get = function() return M._colors end,
    }

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
