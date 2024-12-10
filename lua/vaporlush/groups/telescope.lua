local M = {}

M.url = "https://github.com/nvim-telescope/telescope.nvim"

---@type tokyonight.HighlightsFn
M.mappings = function(c, opts)
  -- stylua: ignore
  return {
    TelescopeBorder         = { fg = c.primary3 },
    TelescopeNormal         = { fg = c.fg },
    TelescopePromptBorder   = { fg = c.primary3 },
    TelescopePromptTitle    = { fg = c.secondary2 },
    TelescopeResultsComment = { fg = c.primary1 },
    TelescopeTitle          = { fg = c.secondary2 }
  }
end

--- @type Vaporlush.Mapping.Set
function M.set(c, opts, nvim_set_hl)
    for key, mapping in pairs(M.mappings(c, opts)) do
        if (mapping.bg == nil) then
            mapping.bg = c.bg
        end
        if (mapping.fg == nil) then
            mapping.fg = c.fg
        end
        nvim_set_hl(key, mapping)
    end
end

return M
