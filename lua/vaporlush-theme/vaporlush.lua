-- ,ggg,         ,gg                                                       ,gggg,                                   
--dP""Y8a       ,8P                                                       d8" "8I                         ,dPYb,    
--Yb, `88       d8'                                                       88  ,dP                         IP'`Yb    
-- `"  88       88                                                     8888888P"                          I8  8I    
--     88       88                                                        88                              I8  8'    
--     I8       8I     ,gggg,gg  gg,gggg,      ,ggggg,     ,gggggg,       88        gg      gg    ,g,     I8 dPgg,  
--     `8,     ,8'    dP"  "Y8I  I8P"  "Yb    dP"  "Y8ggg  dP""""8I  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I 
--      Y8,   ,8P    i8'    ,8I  I8'    ,8i  i8'    ,8I   ,8'    8I dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8 
--       Yb,_,dP    ,d8,   ,d8b,,I8 _  ,d8' ,d8,   ,d8'  ,dP     Y8,Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--        "Y8P"     P"Y8888P"`Y8PI8 YY88888PP"Y8888P"    8P      `Y8 "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--                               I8                                                                                 
--                               I8                                                                                 
--                               I8                                                                                 
--                               I8                                                                                 
--                               I8                                                                                 
--                               I8


-- This is a vaporwave colorscheme that is built with lush neovim plugin
-- 
-- Adam Kalinowski
-- adam@legalautomationsystems.com
--
--
local lush = require('lush')
local hsl = lush.hsl


local VaporLush = {
    Primary = {
        shade0 = hsl(250, 90, 10),
        shade1 = hsl(250, 90, 40),
        shade2 = hsl(250, 90, 60),
        shade3 = hsl(250, 90, 80),
    },
    Secondary = {
        shade0 = hsl(300, 90, 20),
        shade1 = hsl(300, 90, 40),
        shade2 = hsl(300, 90, 60),
        shade3 = hsl(300, 90, 80),
    },
    Tertiary = {
        shade0 = hsl(200, 90, 20),
        shade1 = hsl(200, 90, 40),
        shade2 = hsl(200, 90, 60),
        shade3 = hsl(200, 90, 80),
    },
    Quartenary = {
        shade0 = hsl(275, 90, 20),
        shade1 = hsl(275, 90, 40),
        shade2 = hsl(275, 90, 60),
        shade3 = hsl(275, 90, 80),
    },
    Quintary = {
        shade0 = hsl(180, 100, 30),
        shade1 = hsl(180, 100, 40),
        shade2 = hsl(180, 100, 60),
        shade3 = hsl(180, 100, 90),
    }
}


local UNDERLINE      = true
local ITALIC         = true 
local LIGHTTHEME     = false

local function useunderline(activate)
    local res = ""
    if activate then
        res = "underline"
    end
    return res
end

local function useitalic(activate)
    local res = ""
    if activate then
        res = "italic"
    end
    return res
end

local function lightMode(activate)
    local scheme = {}
    if (activate == true) then
        scheme = {
            Primary = {
                shade0 = hsl(200, 100, 90),
                shade1 = hsl(200, 100, 80),
                shade2 = hsl(200, 100, 60),
                shade3 = hsl(200, 100, 40),
            },
            Secondary = {
                shade0 = hsl(230, 100, 73),
                shade1 = hsl(230, 100, 63),
                shade2 = hsl(230, 100, 43),
                shade3 = hsl(230, 100, 33),
            },
            Tertiary = {
                shade0 = hsl(300, 100, 85),
                shade1 = hsl(300, 100, 65),
                shade2 = hsl(300, 100, 45),
                shade3 = hsl(300, 100, 25),
            },
            Quartenary = {
                shade0 = hsl(180, 100, 80),
                shade1 = hsl(180, 100, 70),
                shade2 = hsl(180, 100, 40),
                shade3 = hsl(180, 100, 25),
            },
            Quintary = {
                shade0 = hsl(275, 100, 85),
                shade1 = hsl(275, 100, 75),
                shade2 = hsl(275, 100, 65),
                shade3 = hsl(275, 100, 55),
            }
        }
    else scheme = VaporLush
    end
    return scheme
end

VaporLush = lightMode(LIGHTTHEME)
local italic = useitalic(ITALIC)
local underline = useunderline(UNDERLINE)

return lush(function(injected_functions)
      local sym = injected_functions.sym
      return {
            CursorLine   { bg = VaporLush.Primary.shade0                                                            },      
            Directory    { bg = VaporLush.Primary.shade0,       fg = VaporLush.Quintary.shade1,     gui = underline },      
            DiffAdd      { bg = VaporLush.Quintary.shade2,      fg = VaporLush.Secondary.shade0                     },      -- Diff mode: Added line |diff.txt|
            DiffChange   { bg = VaporLush.Quintary.shade3,      fg = VaporLush.Secondary.shade2                     },      -- Diff mode: Changed line |diff.txt|
            DiffDelete   { bg = VaporLush.Primary.shade1,       fg = VaporLush.Quartenary.shade2                    },      -- Diff mode: Deleted line |diff.txt|
            DiffText     { bg = VaporLush.Quartenary.shade2,    fg = VaporLush.Tertiary.shade3,     gui=italic      },      
            EndOfBuffer  {  bg = VaporLush.Primary.shade0,      fg = VaporLush.Secondary.shade0,    gui=italic      },      
            VertSplit    {  bg = VaporLush.Primary.shade0,      fg = VaporLush.Secondary.shade0                     },      -- Column separating vertically split windows
            Folded       { bg = VaporLush.Primary.shade0,       fg = VaporLush.Secondary.shade2                     },      -- Line used for closed folds
            FoldColumn   { bg = Folded.bg,                      fg = Folded.fg                                      },      -- 'foldcolumn'
            SignColumn   { bg = Folded.bg,                      fg = VaporLush.Quartenary.shade2                    },      -- Column where |signs| are displayed
            IncSearch    { bg = VaporLush.Quartenary.shade2,    fg = VaporLush.Tertiary.shade3                      },      
            Substitute   { bg = VaporLush.Quartenary.shade1,    fg = VaporLush.Tertiary.shade2                      },      
            LineNr       { bg = VaporLush.Primary.shade0,       fg = VaporLush.Secondary.shade3                     },      
            CursorLineNr {  bg = VaporLush.Primary.shade1,      fg = VaporLush.Quintary.shade1                      },      
            Normal       { bg = VaporLush.Primary.shade0,       fg = VaporLush.Secondary.shade3                     },      -- Normal text
            Pmenu        { Normal                                                                                   },      -- Popup menu: Normal item.
            PmenuSel     { bg = VaporLush.Primary.shade0,       fg = VaporLush.Tertiary.shade3                      },      -- Popup menu: Selected item.
            PmenuSbar    { bg = VaporLush.Primary.shade3,       fg = VaporLush.Tertiary.shade0                      },      -- Popup menu: Scrollbar.
            PmenuThumb   { bg = VaporLush.Primary.shade3,       fg = VaporLush.Tertiary.shade0                      },      -- Popup menu: Thumb of the scrollbar.
            Question     { bg = VaporLush.Secondary.shade0,     fg = VaporLush.Secondary.shade2                     },      -- |hit-enter| prompt and yes/no questions
            Search       { bg = VaporLush.Tertiary.shade3,      fg = VaporLush.Primary.shade0                       }, 
            Visual       { bg = VaporLush.Secondary.shade0,     fg = VaporLush.Tertiary.shade3                      },      -- Visual mode selection

            Comment      { bg = VaporLush.Primary.shade0,       fg = VaporLush.Quintary.shade3,     gui=italic      },      -- Any comment

            Constant     { bg = Normal.bg,                      fg = VaporLush.Quintary.shade2                      },      -- (*) Any constant
            String       { bg = Normal.bg,                      fg = VaporLush.Quintary.shade1                      },      --   A string constant: "this is a string"
            Character    { String                                                                                   },      --   A character constant: 'c', '\n'
            Number       { bg = Normal.bg,                      fg = Constant.fg                                    },      --   A number constant: 234, 0xff
            Boolean      { Constant,                                                                gui=italic      },      --   A boolean constant: TRUE, false
            Float        { Number                                                                                   },      --   A floating point constant: 2.3e10

            Identifier     { Constant,                                                              gui=""          },      -- (*) Any variable name
            Function       { Constant,                                                              gui=italic      },      

            Statement      { bg = VaporLush.Primary.shade0,     fg = VaporLush.Primary.shade2                       },      -- (*) Any statement
            Conditional    { Statement                                                                              },      --   if, then, else, endif, switch, etc.
            Repeat         { Statement,                                                             gui=italic      },      --   for, do, while, etc.
            Label          { Statement,                                                             gui=italic      },      --   case, default, etc.
            Operator       { Statement                                                                              },      --   "sizeof", "+", "*", etc.
            Keyword        { Statement                                                                              },      --   any other keyword
            Exception      { Repeat                                                                                 },      --   try, catch, throw

            PreProc        { bg = Normal.bg,                    fg = VaporLush.Tertiary.shade2,     gui=italic      },      -- (*) Generic Preprocessor
            Include        { PreProc                                                                                },      --   Preprocessor #include
            Define         { PreProc                                                                                },      --   Preprocessor #define
            Macro          { PreProc                                                                                },      --   Same as Define
            PreCondit      { PreProc                                                                                },      --   Preprocessor #if, #else, #endif, etc.

            Type           { bg = Normal.bg,                    fg = VaporLush.Secondary.shade2,    gui=italic      },      -- (*) int, long, char, etc.
            StorageClass   { Type,                                                                                  },      --   static, register, volatile, etc.
            Structure      { Type,                                                                  gui=""          },      --   struct, union, enum, etc.
            Typedef        { Type                                                                                   },      --   A typedef

            Special        { bg = Normal.bg,                    fg = VaporLush.Tertiary.shade3                      },      -- (*) Any special symbol
            SpecialChar    { Special                                                                                },      --   Special character in a constant
            Tag            { Special                                                                                },      --   You can use CTRL-] on this
            Delimiter      { Special                                                                                },      --   Character that needs attention
            SpecialComment { Special,                                                               gui = italic    },      
            Debug          { SpecialComment                                                                         },      --   Debugging statements

            Underlined     { bg= Normal.bg,                     fg= VaporLush.Secondary.shade1,     gui = underline },      -- Text that stands out, HTML links
            Ignore         { bg= VaporLush.Tertiary.shade0,     fg= VaporLush.Quartenary.shade2,    gui = italic    },      
            Error          { bg= VaporLush.Secondary.shade2,     fg= VaporLush.Quintary.shade3                      },      -- Any erroneous construct
            Todo           { bg= VaporLush.Quartenary.shade2,   fg= VaporLush.Quintary.shade3,      gui = underline }, 

            --
            -- LspReferenceText            { } , -- Used for highlighting "text" references
            -- LspReferenceRead            { } , -- Used for highlighting "read" references
            -- LspReferenceWrite           { } , -- Used for highlighting "write" references
            -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
            -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
            -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

            -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
            --
            -- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
            -- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
            -- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
            -- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
            -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
            -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
            -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
            -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
            -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
            -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
            -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
            -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
            -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
            -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
            -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
            -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
            -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
            -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
            -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
            -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

            -- Tree-Sitter syntax groups.
            --
            -- See :h treesitter-highlight-groups, some groups may not be listed,
            -- submit a PR fix to lush-template!
            --
            -- Tree-Sitter groups are defined with an "@" symbol, which must be
            -- specially handled to be valid lua code, we do this via the special
            -- sym function. The following are all valid ways to call the sym function,
            -- for more details see https://www.lua.org/pil/5.html
            --
            -- sym("@text.literal")
            -- sym('@text.literal')
            -- sym"@text.literal"
            -- sym'@text.literal'
            --
            -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

            -- sym"@text.literal"      { }, -- Comment
            -- sym"@text.reference"    { }, -- Identifier
            -- sym"@text.title"        { }, -- Title
            -- sym"@text.uri"          { }, -- Underlined
            -- sym"@text.underline"    { }, -- Underlined
            -- sym"@text.todo"         { }, -- Todo
            -- sym"@comment"           { }, -- Comment
            -- sym"@punctuation"       { }, -- Delimiter
            -- sym"@constant"          { }, -- Constant
            -- sym"@constant.builtin"  { }, -- Special
            -- sym"@constant.macro"    { }, -- Define
            -- sym"@define"            { }, -- Define
            -- sym"@macro"             { }, -- Macro
            -- sym"@string"            { }, -- String
            -- sym"@string.escape"     { }, -- SpecialChar
            -- sym"@string.special"    { }, -- SpecialChar
            -- sym"@character"         { }, -- Character
            -- sym"@character.special" { }, -- SpecialChar
            -- sym"@number"            { }, -- Number
            -- sym"@boolean"           { }, -- Boolean
            -- sym"@float"             { }, -- Float
            -- sym"@function"          { }, -- Function
            -- sym"@function.builtin"  { }, -- Special
            -- sym"@function.macro"    { }, -- Macro
            -- sym"@parameter"         { }, -- Identifier
            -- sym"@method"            { }, -- Function
            -- sym"@field"             { }, -- Identifier
            -- sym"@property"          { }, -- Identifier
            -- sym"@constructor"       { }, -- Special
            -- sym"@conditional"       { }, -- Conditional
            -- sym"@repeat"            { }, -- Repeat
            -- sym"@label"             { }, -- Label
            -- sym"@operator"          { }, -- Operator
            -- sym"@keyword"           { }, -- Keyword
            -- sym"@exception"         { }, -- Exception
            -- sym"@variable"          { }, -- Identifier
            -- sym"@type"              { }, -- Type
            -- sym"@type.definition"   { }, -- Typedef
            -- sym"@storageclass"      { }, -- StorageClass
            -- sym"@structure"         { }, -- Structure
            -- sym"@namespace"         { }, -- Identifier
            -- sym"@include"           { }, -- Include
            -- sym"@preproc"           { }, -- PreProc
            -- sym"@debug"             { }, -- Debug
            -- sym"@tag"               { }, -- Tag
        }
    end
)
