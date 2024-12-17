local Util = require("vaporlush.util")
local vaporlush = require("vaporlush.schemes.vapor")

local M = {}

--- @param c Vaporlush.Palette
--- @param opts Vaporlush.Config
--- @return { [string]: VaporLush.Mapping }
M.mappings = function(c, opts)
    local map =  {
        Array = Util.get_hl_group("@punctuation.bracket", c, opts, "treesitter"),
        Boolean = Util.get_hl_group("@boolean", c, opts, "treesitter"),
        Class = Util.get_hl_group("@type", c, opts, "treesitter"),
        Color = Util.get_hl_group_base("Special", c, opts),
        Constant = Util.get_hl_group("@constant", c, opts, "treesitter"),
        Constructor = Util.get_hl_group("@constructor", c, opts, "treesitter"),
        Enum = Util.get_hl_group("@lsp.type.enum", c, opts, "treesitter"),
        EnumMember = Util.get_hl_group("@lsp.type.enumMember", c, opts, "treesitter"),
        Event = Util.get_hl_group_base("Special", c, opts),
        Field = Util.get_hl_group("@variable.member", c, opts, "treesitter"),
        File = Util.get_hl_group_base("Normal", c, opts),
        Folder = Util.get_hl_group_base("Directory", c, opts),
        Function = Util.get_hl_group("@function", c, opts, "treesitter"),
        Interface = Util.get_hl_group("@lsp.type.interface", c, opts, "treesitter"),
        Key = Util.get_hl_group("@variable.member", c, opts, "treesitter"),
        Keyword = Util.get_hl_group("@lsp.type.keyword", c, opts, "treesitter"),
        Method = Util.get_hl_group("@function.method", c, opts, "treesitter"),
        Module = Util.get_hl_group("@module", c, opts, "treesitter"),
        Namespace = Util.get_hl_group("@module", c, opts, "treesitter"),
        Null = Util.get_hl_group("@constant.builtin", c, opts, "treesitter"),
        Number = Util.get_hl_group("@number", c, opts, "treesitter"),
        Object = Util.get_hl_group("@constant", c, opts, "treesitter"),
        Operator = Util.get_hl_group("@operator", c, opts, "treesitter"),
        Package = Util.get_hl_group("@module", c, opts, "treesitter"),
        Property = Util.get_hl_group("@property", c, opts, "treesitter"),
        Reference = Util.get_hl_group("@markup.link", c, opts, "treesitter"),
        Snippet = Util.get_hl_group_base("Conceal", c, opts),
        String = Util.get_hl_group("@string", c, opts, "treesitter"),
        Struct = Util.get_hl_group("@lsp.type.struct", c, opts, "treesitter"),
        Unit = Util.get_hl_group("@lsp.type.struct", c, opts, "treesitter"),
        Text = Util.get_hl_group("@markup", c, opts, "treesitter"),
        TypeParameter = Util.get_hl_group("@lsp.type.typeParameter", c, opts, "treesitter"),
        Variable = Util.get_hl_group("@variable", c, opts, "treesitter"),
        Value = Util.get_hl_group("@string", c, opts, "treesitter"),
    }
    return map
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
        key = "LspKind" ..key
        nvim_set_hl(key, mapping)
    end
end

return M
