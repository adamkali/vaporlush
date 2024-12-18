local Util = require("vaporlush.util")
local Config = require("vaporlush.config")


local M = {}

-- stylua: ignore
M.plugins = {
    ["nvim-cmp"]       = "cmp",
    --["nvim-dap"]                = "dap",
    --["nvim-navic"]              = "navic",
    --["nvim-notify"]             = "notify",
    --["nvim-scrollbar"]          = "scrollbar",
    --["nvim-tree.lua"]           = "nvim-tree",
    --["nvim-treesitter-context"] = "treesitter-context",
    --["octo.nvim"]               = "octo",
    ["oil.nvim"]       = "oil",
    --["rainbow-delimiters.nvim"] = "rainbow",
    --["render-markdown.nvim"]    = "render-markdown",
    --["snacks.nvim"]             = "snacks",
    --["supermaven-nvim"]         = "supermaven",
    ["telescope.nvim"] = "telescope",
    --["trouble.nvim"]            = "trouble",
    --["vim-gitgutter"]           = "gitgutter",
    --["vim-glyph-palette"]       = "glyph-palette",
    --["vim-illuminate"]          = "illuminate",
    --["vim-sneak"]               = "sneak",
    --["vimwiki"]                 = "vimwiki",
    --["which-key.nvim"]          = "which-key",
    --["yanky.nvim"]              = "yanky"
}

local me = debug.getinfo(1, "S").source:sub(2)
me = vim.fn.fnamemodify(me, ":h")

function M.get_group(name)
    ---@type {set: Vaporlush.HighlightsFn, url: string, mappings: table}
    return Util.mod("vaporlush.groups." .. name)
end

---@param colors Vaporlush.Palette
---@param opts Vaporlush.Config
function M.get(name, colors, opts)
    local mod = M.get_group(name)
    return mod.mappings(colors, opts)
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
--- @param val vim.api.keyset.highlight a table constructed in the following { fg = Vaporlush.Palette[field], bg = Vaporlush.Palette[field], .. }
--- |:help nvim_set_hl|
function nvim_set_hl(name, val)
    vim.api.nvim_set_hl(0, name, val)
end

---@param colors Vaporlush.Palette
---@param opts Vaporlush.Config
function M.setup(colors, opts)
    local groups = {
        base = true,
        kinds = true,
        semantic_tokens = true,
        treesitter = true,
    }

    if opts.plugins.all then
        for _, group in pairs(M.plugins) do
            groups[group] = true
        end
    elseif opts.plugins.auto and package.loaded.lazy then
        local plugins = require("lazy.core.config").plugins
        for plugin, group in pairs(M.plugins) do
            if plugins[plugin] then
                groups[group] = true
            end
        end

        -- special case for mini.nvim
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

    local cache_key = opts.style
    local cache = opts.cache and Util.cache.read(cache_key)

    local inputs = {
        colors = colors,
        plugins = names,
        version = Config.version,
        opts = { transparent = opts.transparent, styles = opts.styles, dim_inactive = opts.dim_inactive },
    }

    local ret = cache and vim.deep_equal(inputs, cache.inputs) and cache.groups

    if not ret then
        ret = {}
        -- merge highlights
        for group in pairs(groups) do
            for k, v in pairs(M.get(group, colors, opts)) do
                ret[k] = v
            end
        end
        vim.print({ ['cs'] = ret })
        Util.resolve(ret)
        if opts.cache then
            Util.cache.write(cache_key, { groups = ret, inputs = inputs })
        end
    end
   -- opts.on_highlights(ret, colors)
   return ret
end

return M
