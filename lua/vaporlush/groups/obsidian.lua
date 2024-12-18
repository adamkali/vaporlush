local M = {}

--- Obsidian Highlight groups
---@param c Vaporlush.Palette
---@param opts Vaporlush.Global
---@return VaporLush.Mapping
M.mappings = function(c, opts)
    -- stylua: ignore
    return {
        ObsidianTag = { fg = c.primary3 },
        ObsidianDone = { fg = c.quartary3, bg = c.primary0 },
        ObsidianTodo = { fg = c.primary3, bg = c.secondary1 },
        ObsidianTilde = { fg = c.secondary3, bg = c.tertiary1 },
        ObsidianBullet = { fg = c.primary2 },
        ObsidianBlockID = { fg = c.secondary2 },
        ObsidianRefText = { fg = c.secondary2 },
        ObsidianImportant = { fg = c.tertiary3 },
        ObsidianRightArrow = { fg = c.tertiary1 },
        ObsidianExtLinkIcon = { fg = c.tertiary1, underline = true },
        ObsidianHighlightText = { fg = c.fg_highlight },
    }
end



return M
