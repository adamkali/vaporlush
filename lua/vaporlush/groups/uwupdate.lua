local M = {}

M.url = "local:lua/plugins/uwupdate"

-- UwUpdate defines these groups itself (default-linked) and reasserts them on
-- ColorScheme only if the active theme hasn't set them -- so defining them here
-- makes vaporlush win. Colors mirror the plugin's default links:
--   UwUpdateOk -> DiagnosticOk, UwUpdatePending -> DiagnosticWarn,
--   UwUpdateError -> DiagnosticError, UwUpdateMuted -> Comment, UwUpdateHeader -> Title.
--- @param c Vaporlush.Palette
--- @param opts Vaporlush.Config
--- @return { [string]: VaporLush.Mapping }
M.mappings = function(c, opts)
    return {
        UwUpdateOk      = { fg = c.gitsigns.add,    bold = true }, -- ✓ up to date / ✔ updated
        UwUpdatePending = { fg = c.quartary1,       bold = true }, -- ⟳ update available / ↺ reset
        UwUpdateError   = { fg = c.gitsigns.danger, bold = true }, -- ✗ fetch/checkout failed
        UwUpdateMuted   = { fg = c.comment },                      -- • unchecked, spinner, ⊘ canceled
        UwUpdateHeader  = { fg = c.tertiary2,       bold = true }, -- name  head → target header line
    }
end

--- @param c Vaporlush.Palette
--- @param opts Vaporlush.Config
--- @param nvim_set_hl Vaporlush.HighlightsFn
function M.set(c, opts, nvim_set_hl)
    for key, mapping in pairs(M.mappings(c, opts)) do
        nvim_set_hl(key, mapping)
    end
end

return M
