local M = {}
local Util = require("vaporlush.util")
local _ = require("vaporlush.schemes.init")

M.url = "https://cmp.saghen.dev/"
---@param c Vaporlush.Palette
function M.mappings(c, opts)
    -- stylua: ignore
    local ghost = Util.blend_fg(c.comment, 0.5)
    return {
        BlinkCmpDoc = { fg = c.fg, bg = c.bg_highlight },
        BlinkCmpKind = { fg = c.primary1, bg = c.bg_highlight },
        BlinkCmpMenu = { fg = c.secondary3, bg = c.bg_highlight },
        BlinkCmpAbbr = { fg = c.comment, bg = c.bg_highlight },
        BlinkCmpSource = { fg = c.primary1, bg = c.bg_highlight },
        BlinkCmpKindEnum = { fg = c.primary2, bg = c.bg_highlight },
        BlinkCmpKindFile = { fg = c.secondary3, bg = c.bg_highlight },
        BlinkCmpKindText = { fg = c.primary3, bg = c.bg_highlight },
        BlinkCmpKindUnit = { fg = c.primary1, bg = c.bg_highlight },
        BlinkCmpDocBorder = { fg = c.quartary0, bg = c.bg_highlight },
        BlinkCmpGhostText = { fg = ghost, bg = c.bg_highlight },
        BlinkCmpKindClass = { fg = c.primary3, bg = c.bg_highlight },
        BlinkCmpKindColor = { fg = c.tertiary2, bg = c.bg_highlight },
        BlinkCmpKindEvent = { fg = c.primary1, bg = c.bg_highlight },
        BlinkCmpKindField = { fg = c.secondary2, bg = c.bg_highlight },
        BlinkCmpKindValue = { fg = c.secondary3, bg = c.bg_highlight },
        BlinkCmpKindInterface = { fg = c.primary3, bg = c.bg_highlight },
        BlinkCmpKindMethod = { fg = c.secondary2, bg = c.bg_highlight },
        BlinkCmpKindModule = { fg = c.quartary2, bg = c.bg_highlight },
        BlinkCmpKindStruct = { fg = c.primary3, bg = c.bg_highlight },
        BlinkCmpMenuBorder = { fg = c.quartary0, bg = c.bg_highlight },
        BlinkCmpKindKeyword = { fg = c.primary2, bg = c.bg_highlight },
        BlinkCmpKindSnippet = { fg = c.quartary3, bg = c.bg_highlight },
        BlinkCmpLabelDetail = { fg = c.quartary0, bg = c.bg_highlight },
        BlinkCmpDocSeparator = { fg = c.tertiary3, bg = c.bg_highlight },
        BlinkCmpKindConstant = { fg = c.secondary0, bg = c.bg_highlight },
        BlinkCmpKindFunction = { fg = c.secondary1, bg = c.bg_highlight },
        BlinkCmpKindOperator = { fg = c.secondary1, bg = c.bg_highlight },
        BlinkCmpKindProperty = { fg = c.secondary2, bg = c.bg_highlight },
        BlinkCmpKindVariable = { fg = c.secondary3, bg = c.bg_highlight },
        BlinkCmpDocCursorLine = { fg = c.fg, bg = c.bg_highlight },
        BlinkCmpKindReference = { fg = c.secondary3, bg = c.bg_highlight },
        BlinkCmpMenuSelection = { fg = c.primary2, bg = c.quartary0 },
        BlinkCmpSignatureHelp = { fg = c.fg, bg = c.bg_highlight },
        BlinkCmpKindEnumMember = { fg = c.secondary3, bg = c.bg_highlight },
        BlinkCmpScrollBarThumb = { fg = c.quartary0, bg = c.bg_highlight },
        BlinkCmpKindConstructor = { fg = c.secondary0, bg = c.bg_highlight },
        BlinkCmpLabelDeprecated = { fg = c.quartary0, bg = c.bg_highlight },
        BlinkCmpScrollBarGutter = { fg = c.quartary0, bg = c.bg_highlight },
        BlinkCmpLabelDescription = { fg = c.gitsigns.danger, bg = c.bg_highlight },
        BlinkCmpKindTypeParameter = { fg = c.quartary1, bg = c.bg_highlight },
        BlinkCmpCursorLineMenuHack = { fg = c.gitsigns.info, bg = c.bg_highlight },
        BlinkCmpSignatureHelpBorder = { fg = c.gitsigns.info, bg = c.bg_highlight },
        BlinkCmpCursorLineDocumentationHack = { fg = c.gitsigns.info, bg = c.bg_highlight },
        BlinkCmpSignatureHelpActiveParameter = { fg = c.gitsigns.info, bg = c.bg_highlight },
    }
end

--- @type Vaporlush.Mapping.Set
function M.set(c, opts, nvim_set_hl)
    for key, mapping in pairs(M.mappings(c, opts)) do
        Snacks.debug(key, mapping)
        nvim_set_hl(key, mapping)
    end
end

return M
