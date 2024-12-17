local M = {}
local Util = require("vaporlush.util")
local _ = require("vaporlush.schemes.init")

M.url = "https://github.com/hrsh7th/nvim-cmp"

---@param c Vaporlush.Palette
function M.mappings(c, opts)
    -- stylua: ignore
    print('cmp')
    local ghost = Util.blend_fg(c.comment, 0.5)
    local ret = {
        CmpDocumentation       = { fg = c.fg, bg = c.bg_highlight},
        CmpDocumentationBorder = { fg = c.primary1, bg = c.bg_highlight},
        CmpGhostText           = { fg = ghost },
        CmpItemAbbr            = { fg = c.comment },
        CmpItemAbbrDeprecated  = { fg = ghost, strikethrough = true },
        CmpItemAbbrMatch       = { fg = c.secondary2 },
        CmpItemAbbrMatchFuzzy  = { fg = c.primary1},
        CmpItemKindCodeium     = { fg = c.quartary3 },
        CmpItemKindCopilot     = { fg = c.quartary3 },
        CmpItemKindSupermaven  = { fg = c.quartary3 },
        CmpItemKindDefault     = { fg = c.fg_highlight },
        CmpItemKindTabNine     = { fg = c.quartary3 },
        CmpItemMenu            = { fg = c.fg },
        CmpItemKindArray = Util.get_hl_group("@punctuation.bracket", c, opts, "treesitter", true),
        CmpItemKindBoolean = Util.get_hl_group("@boolean", c, opts, "treesitter", true),
        CmpItemKindClass = Util.get_hl_group("@type", c, opts, "treesitter", true),
        CmpItemKindColor = Util.get_hl_group_base("Special", c, opts),
        CmpItemKindConstant = Util.get_hl_group("@constant", c, opts, "treesitter", true),
        CmpItemKindConstructor = Util.get_hl_group("@constructor", c, opts, "treesitter", true),
        CmpItemKindEnum = Util.get_hl_group("@lsp.type.enum", c, opts, "treesitter", true),
        CmpItemKindEnumMember = Util.get_hl_group("@lsp.type.enumMember", c, opts, "treesitter", true),
        CmpItemKindEvent = Util.get_hl_group_base("Special", c, opts),
        CmpItemKindField = Util.get_hl_group("@variable.member", c, opts, "treesitter", true),
        CmpItemKindFile = Util.get_hl_group_base("Normal", c, opts),
        CmpItemKindFolder = Util.get_hl_group_base("Directory", c, opts),
        CmpItemKindFunction = Util.get_hl_group("@function", c, opts, "treesitter", true),
        CmpItemKindInterface = Util.get_hl_group("@lsp.type.interface", c, opts, "treesitter", true),
        CmpItemKindKey = Util.get_hl_group("@variable.member", c, opts, "treesitter", true),
        CmpItemKindKeyword = Util.get_hl_group("@lsp.type.keyword", c, opts, "treesitter", true),
        CmpItemKindMethod = Util.get_hl_group("@function.method", c, opts, "treesitter", true),
        CmpItemKindModule = Util.get_hl_group("@module", c, opts, "treesitter", true),
        CmpItemKindNamespace = Util.get_hl_group("@module", c, opts, "treesitter", true),
        CmpItemKindNull = Util.get_hl_group("@constant.builtin", c, opts, "treesitter", true),
        CmpItemKindNumber = Util.get_hl_group("@number", c, opts, "treesitter", true),
        CmpItemKindObject = Util.get_hl_group("@constant", c, opts, "treesitter", true),
        CmpItemKindOperator = Util.get_hl_group("@operator", c, opts, "treesitter", true),
        CmpItemKindPackage = Util.get_hl_group("@module", c, opts, "treesitter", true),
        CmpItemKindProperty = Util.get_hl_group("@property", c, opts, "treesitter", true),
        CmpItemKindReference = Util.get_hl_group("@markup.link", c, opts, "treesitter", true),
        CmpItemKindSnippet = Util.get_hl_group("@function", c, opts,"treesitter", true),
        CmpItemKindString = Util.get_hl_group("@string", c, opts, "treesitter", true),
        CmpItemKindStruct = Util.get_hl_group("@lsp.type.struct", c, opts, "treesitter", true),
        CmpItemKindUnit = Util.get_hl_group("@lsp.type.struct", c, opts, "treesitter", true),
        CmpItemKindText = Util.get_hl_group("@markup", c, opts, "treesitter", true),
        CmpItemKindTypeParameter = Util.get_hl_group("@lsp.type.typeParameter", c, opts, "treesitter", true),
        CmpItemKindVariable = Util.get_hl_group("@variable", c, opts, "treesitter", true),
        CmpItemKindValue = Util.get_hl_group("@string", c, opts, "treesitter", true),
    }

    local maps = require("vaporlush.groups.kinds").mappings(c, opts)
    for map, config in pairs(maps) do
        ret["CmpItemKind" .. map] = config
    end
    return ret
end

--- @type Vaporlush.Mapping.Set
function M.set(c, opts, nvim_set_hl)
    for key, mapping in pairs(M.mappings(c, opts)) do
        nvim_set_hl(key, mapping)
    end
end

return M
