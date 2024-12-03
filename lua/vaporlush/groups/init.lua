local Config = require("vaporlush.config")
local Util = require("vaporlush.util")

local M = {}

-- stylua: ignore
M.plugins = {
    ["aerial.nvim"]             = "aerial",
    ["ale"]                     = "ale",
    ["alpha-nvim"]              = "alpha",
    ["barbar.nvim"]             = "barbar",
    ["blink.cmp"]               = "blink",
    ["bufferline.nvim"]         = "bufferline",
    ["codeium.nvim"]            = "codeium",
    ["copilot.lua"]             = "copilot",
    ["dashboard-nvim"]          = "dashboard",
    ["flash.nvim"]              = "flash",
    ["fzf-lua"]                 = "fzf",
    ["gitsigns.nvim"]           = "gitsigns",
    ["grug-far.nvim"]           = "grug-far",
    ["headlines.nvim"]          = "headlines",
    ["hop.nvim"]                = "hop",
    ["indent-blankline.nvim"]   = "indent-blankline",
    ["indentmini.nvim"]         = "indentmini",
    ["lazy.nvim"]               = "lazy",
    ["leap.nvim"]               = "leap",
    ["lspsaga.nvim"]            = "lspsaga",
    ["mini.animate"]            = "mini_animate",
    ["mini.clue"]               = "mini_clue",
    ["mini.completion"]         = "mini_completion",
    ["mini.cursorword"]         = "mini_cursorword",
    ["mini.deps"]               = "mini_deps",
    ["mini.diff"]               = "mini_diff",
    ["mini.files"]              = "mini_files",
    ["mini.hipatterns"]         = "mini_hipatterns",
    ["mini.icons"]              = "mini_icons",
    ["mini.indentscope"]        = "mini_indentscope",
    ["mini.jump"]               = "mini_jump",
    ["mini.map"]                = "mini_map",
    ["mini.notify"]             = "mini_notify",
    ["mini.operators"]          = "mini_operators",
    ["mini.pick"]               = "mini_pick",
    ["mini.starter"]            = "mini_starter",
    ["mini.statusline"]         = "mini_statusline",
    ["mini.surround"]           = "mini_surround",
    ["mini.tabline"]            = "mini_tabline",
    ["mini.test"]               = "mini_test",
    ["mini.trailspace"]         = "mini_trailspace",
    ["neo-tree.nvim"]           = "neo-tree",
    ["neogit"]                  = "neogit",
    ["neotest"]                 = "neotest",
    ["noice.nvim"]              = "noice",
    ["nvim-cmp"]                = "cmp",
    ["nvim-dap"]                = "dap",
    ["nvim-navic"]              = "navic",
    ["nvim-notify"]             = "notify",
    ["nvim-scrollbar"]          = "scrollbar",
    ["nvim-tree.lua"]           = "nvim-tree",
    ["nvim-treesitter-context"] = "treesitter-context",
    ["octo.nvim"]               = "octo",
    ["rainbow-delimiters.nvim"] = "rainbow",
    ["render-markdown.nvim"]    = "render-markdown",
    ["snacks.nvim"]             = "snacks",
    ["supermaven-nvim"]         = "supermaven",
    ["telescope.nvim"]          = "telescope",
    ["trouble.nvim"]            = "trouble",
    ["vim-gitgutter"]           = "gitgutter",
    ["vim-glyph-palette"]       = "glyph-palette",
    ["vim-illuminate"]          = "illuminate",
    ["vim-sneak"]               = "sneak",
    ["vimwiki"]                 = "vimwiki",
    ["which-key.nvim"]          = "which-key",
    ["yanky.nvim"]              = "yanky"
}

local me = debug.getinfo(1, "S").source:sub(2)
me = vim.fn.fnamemodify(me, ":h")

function M.get_group(name)
    ---@type {set: Vaporlush.HighlightsFn, url: string}
    return Util.mod("vaporlush.groups." .. name)
end

---@param colors Vaporlush.Palette
---@param opts Vaporlush.Config
function M.get(name, colors, opts)
    local mod = M.get_group(name)
    return mod.set(colors, opts, nvim_set_hl)
end

--- @class VaporLush.Mapping
--- @field fg string? color name or "#RRGGBB", see note.
--- @field bg string? color name or "#RRGGBB", see note.
--- @field sp string? color name or "#RRGGBB"
--- @field blend number?
--- @field bold boolean?
--- @field standout boolean?
--- @field underline boolean?
--- @field undercurl boolean?
--- @field underdouble boolean?
--- @field underdotted boolean?
--- @field underdashed boolean?
--- @field strikethrough boolean?
--- @field italic boolean?
--- @field reverse boolean?
DefaultMapping = {}

--- @class Vaporlush.HighlightsFn
--- @param name string highlight group name e.g. "ErrorMsg"
--- @param val Vaporlush.Mapping a table constructed in the following { fg = Vaporlush.Palette[field], bg = Vaporlush.Palette[field], .. }
--- @see |:help nvim_set_hl|
function nvim_set_hl(name, val)
    vim.api.nvim_set_hl(0, name, val)
end

---@param colors Vaporlush.Palette
---@param opts Vaporlush.Config
function M.setup(colors, opts)
    local groups = {
        base = true,
        --kinds = true,
        --semantic_tokens = true,
        treesitter = true,
    }

    --if opts.plugins.all then
    --  for _, group in pairs(M.plugins) do
    --    groups[group] = true
    --  end
    --elseif opts.plugins.auto and package.loaded.lazy then
    --  local plugins = require("lazy.core.config").plugins
    --  for plugin, group in pairs(M.plugins) do
    --    if plugins[plugin] then
    --      groups[group] = true
    --    end
    --  end

    --  -- special case for mini.nvim
    --  if plugins["mini.nvim"] then
    --    for _, group in pairs(M.plugins) do
    --      if group:find("^mini_") then
    --        groups[group] = true
    --      end
    --    end
    --  end
    --end

    -- manually enable/disable plugins
    -- for plugin, group in pairs(M.plugins) do
    --   local use = opts.plugins[group]
    --   use = use == nil and opts.plugins[plugin] or use
    --   if use ~= nil then
    --     if type(use) == "table" then
    --       use = use.enabled
    --     end
    --     groups[group] = use or nil
    --   end
    -- end

    -- local names = vim.tbl_keys(groups)
    -- table.sort(names)

    -- local cache_key = opts.style
    -- local cache = opts.cache and Util.cache.read(cache_key)

    -- local inputs = {
    --   colors = colors,
    --   plugins = names,
    --   version = Config.version,
    --   opts = { transparent = opts.transparent, styles = opts.styles, dim_inactive = opts.dim_inactive },
    -- }

    local ret = cache and vim.deep_equal(inputs, cache.inputs) and cache.groups
    if not ret then
        ret = {}
        for group in pairs(groups) do
            M.get(group, colors, opts)
        end
    end
end

return M
