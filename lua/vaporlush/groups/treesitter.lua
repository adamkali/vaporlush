local Util = require("vaporlush.util")
local vapor_base = require("vaporlush.groups.base")

local M = {}


---@param c Vaporlush.Palette
---@param opts Vaporlush.Config
---@return { [string]: VaporLush.Mapping }
M.mappings = function(c, opts)
    local map =  {
        ["@annotation"]                   = Util.get_hl_group_base("PreProc",c,opts),
        ["@attribute"]                    = Util.get_hl_group_base("PreProc",c,opts),
        ["@boolean"]                      = Util.get_hl_group_base("Boolean",c,opts),
        ["@character"]                    = Util.get_hl_group_base("Character",c,opts),
        ["@character.printf"]             = Util.get_hl_group_base("SpecialChar",c,opts),
        ["@character.special"]            = Util.get_hl_group_base("SpecialChar",c,opts),
        ["@comment"]                      = Util.get_hl_group_base("Comment",c,opts),
        ["@comment.error"]                = { fg = c.gitsigns.danger },
        ["@comment.hint"]                 = { fg = c.gitsigns.add },
        ["@comment.info"]                 = { fg = c.gitsigns.info },
        ["@comment.note"]                 = { fg = c.gitsigns.add },
        ["@comment.todo"]                 = { fg = c.gitsigns.info },
        ["@comment.warning"]              = { fg = c.gitsigns.change },
        -- ["@constructor"]                  = { fg = c.tertiary2, bold = true, italic = true }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
        -- ["@constructor.tsx"]              = { fg = c.blue1, bold = true },
        -- ["@keyword"]                      = { fg = c.primary1, style = opts.styles.keywords }, -- For keywords that don't fall in previous categories.
        -- ["@keyword.function"]             = { fg = c.magenta, style = opts.styles.functions }, -- For keywords used to define a function.
        -- ["@label"]                        = { fg = c.blue }, -- For labels: `label:` in C and `:label:` in Lua.
        -- ["@variable"]                     = { fg = c.fg, style = opts.styles.variables }, -- Any variable name that does not have another highlight.
        -- ["@variable.builtin"]             = { fg = c.red },                         -- Variable names that are defined by the languages, like `this` or `self`.
        -- ["@variable.member"]              = { fg = c.green1 },                      -- For fields.
        -- ["@variable.parameter"]           = { fg = c.yellow },                      -- For parameters of a function.
        -- ["@variable.parameter.builtin"]   = { fg = Util.blend_fg(c.yellow, 0.8) },  -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]
        -- ["@operator"]                     = { fg = c.blue5 }, -- For any operator: `+`, but also `->` and `*` in C.
        -- ["@property"]                     = { fg = c.green1 },
        -- ["@punctuation.bracket"]          = { fg = c.fg_dark }, -- For brackets and parens.
        -- ["@punctuation.delimiter"]        = { fg = c.blue5 }, -- For delimiters ie: `.`
        -- ["@punctuation.special"]          = { fg = c.blue5 }, -- For special symbols (e.g. `{}` in string interpolation)
        -- ["@punctuation.special.markdown"] = { fg = c.orange }, -- For special symbols (e.g. `{}` in string interpolation)
        -- ["@string.documentation"]         = { fg = c.yellow },
        -- ["@string.escape"]                = { fg = c.magenta }, -- For escape characters within a string.
        -- ["@string.regexp"]                = { fg = c.blue6 }, -- For regexes.
        -- ["@tag.delimiter.tsx"]            = { fg = Util.blend_bg(c.blue, 0.7) },
        -- ["@tag.tsx"]                      = { fg = c.red },
        -- ["@tag.javascript"]               = { fg = c.red },
        -- ["@type.builtin"]                 = { fg = Util.blend_bg(c.blue1, 0.8) },
        -- ["@markup.list"]                  = { fg = c.blue5 }, -- For special punctutation that does not fall in the categories before.
        -- ["@markup.list.checked"]          = { fg = c.green1 }, -- For brackets and parens.
        -- ["@markup.list.markdown"]         = { fg = c.orange, bold = true },
        -- ["@markup.list.unchecked"]        = { fg = c.blue }, -- For brackets and parens.
        -- ["@markup.raw.markdown_inline"]   = { bg = c.terminal_black, fg = c.blue },
        ["@markup.strikethrough"]         = { strikethrough = true },
        ["@markup.strong"]                = { bold = true },
        ["@markup.underline"]             = { underline = true },
        ["@constant"]                     = Util.get_hl_group_base("Constant",c,opts),
        ["@constant.builtin"]             = Util.get_hl_group_base("Special",c,opts),
        ["@constant.macro"]               = Util.get_hl_group_base("Define",c,opts),
        ["@diff.delta"]                   = Util.get_hl_group_base("DiffChange",c,opts),
        ["@diff.minus"]                   = Util.get_hl_group_base("DiffDelete",c,opts),
        ["@diff.plus"]                    = Util.get_hl_group_base("DiffAdd",c,opts),
        ["@function"]                     = Util.get_hl_group_base("Function",c,opts),
        ["@function.builtin"]             = Util.get_hl_group_base("Special",c,opts),
        ["@function.call"]                = Util.get_hl_group_base("@function",c,opts),
        ["@function.macro"]               = Util.get_hl_group_base("Macro",c,opts),
        ["@function.method"]              = Util.get_hl_group_base("Function",c,opts),
        ["@function.method.call"]         = Util.get_hl_group_base("@function.method",c,opts),
        ["@keyword.conditional"]          = Util.get_hl_group_base("Conditional",c,opts),
        ["@keyword.coroutine"]            = Util.get_hl_group_base("@keyword",c,opts),
        ["@keyword.debug"]                = Util.get_hl_group_base("Debug",c,opts),
        ["@keyword.directive"]            = Util.get_hl_group_base("PreProc",c,opts),
        ["@keyword.directive.define"]     = Util.get_hl_group_base("Define",c,opts),
        ["@keyword.exception"]            = Util.get_hl_group_base("Exception",c,opts),
        ["@keyword.import"]               = Util.get_hl_group_base("Include",c,opts),
        ["@keyword.operator"]             = Util.get_hl_group_base("@operator",c,opts),
        ["@keyword.repeat"]               = Util.get_hl_group_base("Repeat",c,opts),
        ["@keyword.return"]               = Util.get_hl_group_base("@keyword",c,opts),
        ["@keyword.storage"]              = Util.get_hl_group_base("StorageClass",c,opts),
        ["@markup"]                       = Util.get_hl_group_base("@none",c,opts),
        ["@markup.environment"]           = Util.get_hl_group_base("Macro",c,opts),
        ["@markup.environment.name"]      = Util.get_hl_group_base("Type",c,opts),
        ["@markup.heading"]               = Util.get_hl_group_base("Title",c,opts),
        ["@markup.link.label"]            = Util.get_hl_group_base("SpecialChar",c,opts),
        ["@markup.link.label.symbol"]     = Util.get_hl_group_base("Identifier",c,opts),
        ["@markup.math"]                  = Util.get_hl_group_base("Special",c,opts),
        ["@markup.raw"]                   = Util.get_hl_group_base("String",c,opts),
        ["@markup.link.url"]              = Util.get_hl_group_base("Underlined",c,opts),
        ["@module"]                       = Util.get_hl_group_base("Include",c,opts),
        ["@namespace.builtin"]            = Util.get_hl_group_base("@variable.builtin",c,opts),
        ["@number"]                       = Util.get_hl_group_base("Number",c,opts),
        ["@number.float"]                 = Util.get_hl_group_base("Float",c,opts),
        ["@string"]                       = Util.get_hl_group_base("String",c,opts),
        ["@tag"]                          = Util.get_hl_group_base("Label",c,opts),
        ["@tag.attribute"]                = Util.get_hl_group_base("@property",c,opts),
        ["@tag.delimiter"]                = Util.get_hl_group_base("Delimiter",c,opts),
        ["@type"]                         = Util.get_hl_group_base("Type",c,opts),
        ["@type.definition"]              = Util.get_hl_group_base("Typedef",c,opts),
        ["@type.qualifier"]               = Util.get_hl_group_base("@keyword",c,opts),
    }


    return map
end

---@type Vaporlush.Mapping.Set
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
