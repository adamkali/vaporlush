local Util = require("vaporlush.util")

local M = {}

M.mappings = function(c, opts)
  -- stylua: ignore
  return {
    ["@lsp.typemod.type.defaultLibrary"]       = { fg = Util.blend_bg(c.primary3, 0.8) },
    ["@lsp.typemod.typeAlias.defaultLibrary"]  = { fg = Util.blend_bg(c.primary3, 0.8) },
    ["@lsp.type.unresolvedReference"]          = { undercurl = true, sp = c.gitsigns.danger },
    ["@lsp.type.interface"]                    = { fg = Util.blend_fg(c.primary3, 0.7) },
    ["@lsp.type.boolean"]                      = Util.get_hl_group("@boolean", c, opts, "treesitter"),
    ["@lsp.type.builtinType"]                  = Util.get_hl_group("@type.builtin", c, opts, "treesitter"),
    ["@lsp.type.comment"]                      = Util.get_hl_group("@comment", c, opts, "treesitter"),
    ["@lsp.type.decorator"]                    = Util.get_hl_group("@attribute", c, opts, "treesitter"),
    ["@lsp.type.deriveHelper"]                 = Util.get_hl_group("@attribute", c, opts, "treesitter"),
    ["@lsp.type.enum"]                         = Util.get_hl_group("@type", c, opts, "treesitter"),
    ["@lsp.type.enumMember"]                   = Util.get_hl_group("@constant", c, opts, "treesitter"),
    ["@lsp.type.escapeSequence"]               = Util.get_hl_group("@string.escape", c, opts, "treesitter"),
    ["@lsp.type.formatSpecifier"]              = Util.get_hl_group("@markup.list", c, opts, "treesitter"),
    ["@lsp.type.generic"]                      = Util.get_hl_group("@variable", c, opts, "treesitter"),
    ["@lsp.type.keyword"]                      = Util.get_hl_group("@keyword", c, opts, "treesitter"),
    ["@lsp.type.lifetime"]                     = Util.get_hl_group("@keyword.storage", c, opts, "treesitter"),
    ["@lsp.type.namespace"]                    = Util.get_hl_group("@module", c, opts, "treesitter"),
    ["@lsp.type.namespace.python"]             = Util.get_hl_group("@variable", c, opts, "treesitter"),
    ["@lsp.type.number"]                       = Util.get_hl_group("@number", c, opts, "treesitter"),
    ["@lsp.type.operator"]                     = Util.get_hl_group("@operator", c, opts, "treesitter"),
    ["@lsp.type.parameter"]                    = Util.get_hl_group("@variable.parameter", c, opts, "treesitter"),
    ["@lsp.type.property"]                     = Util.get_hl_group("@property", c, opts, "treesitter"),
    ["@lsp.type.selfKeyword"]                  = Util.get_hl_group("@variable.builtin", c, opts, "treesitter"),
    ["@lsp.type.selfTypeKeyword"]              = Util.get_hl_group("@variable.builtin", c, opts, "treesitter"),
    ["@lsp.type.string"]                       = Util.get_hl_group("@string", c, opts, "treesitter"),
    ["@lsp.type.typeAlias"]                    = Util.get_hl_group("@type.definition", c, opts, "treesitter"),
    ["@lsp.typemod.class.defaultLibrary"]      = Util.get_hl_group("@type.builtin", c, opts, "treesitter"),
    ["@lsp.typemod.enum.defaultLibrary"]       = Util.get_hl_group("@type.builtin", c, opts, "treesitter"),
    ["@lsp.typemod.enumMember.defaultLibrary"] = Util.get_hl_group("@constant.builtin", c, opts, "treesitter"),
    ["@lsp.typemod.function.defaultLibrary"]   = Util.get_hl_group("@function.builtin", c, opts, "treesitter"),
    ["@lsp.typemod.keyword.async"]             = Util.get_hl_group("@keyword.coroutine", c, opts, "treesitter"),
    ["@lsp.typemod.keyword.injected"]          = Util.get_hl_group("@keyword", c, opts, "treesitter"),
    ["@lsp.typemod.macro.defaultLibrary"]      = Util.get_hl_group("@function.builtin", c, opts, "treesitter"),
    ["@lsp.typemod.method.defaultLibrary"]     = Util.get_hl_group("@function.builtin", c, opts, "treesitter"),
    ["@lsp.typemod.operator.injected"]         = Util.get_hl_group("@operator", c, opts, "treesitter"),
    ["@lsp.typemod.string.injected"]           = Util.get_hl_group("@string", c, opts, "treesitter"),
    ["@lsp.typemod.struct.defaultLibrary"]     = Util.get_hl_group("@type.builtin", c, opts, "treesitter"),
    ["@lsp.typemod.variable.callable"]         = Util.get_hl_group("@function", c, opts, "treesitter"),
    ["@lsp.typemod.variable.defaultLibrary"]   = Util.get_hl_group("@variable.builtin", c, opts, "treesitter"),
    ["@lsp.typemod.variable.injected"]         = Util.get_hl_group("@variable", c, opts, "treesitter"),
    ["@lsp.typemod.variable.static"]           = Util.get_hl_group("@constant", c, opts, "treesitter"),
  }
end

--- @type Vaporlush.Mapping.Set
function M.set(c, opts, nvim_set_hl)
    for key, mapping in pairs(M.mappings(c, opts)) do
        nvim_set_hl(key, mapping)
    end
end

return M
