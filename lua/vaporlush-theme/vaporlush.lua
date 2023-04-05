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

local TRANSPARENT = false

local function isTransparent()
    if TRANSPARENT then
        return None 
    else return hsl(250, 80, 8) end
end
local VaporLush = {
    Background = NONE,
    Primary = {
        shade0 = hsl(250, 100, 20),
        shade1 = hsl(250, 100, 30),
        shade2 = hsl(250, 100, 50),
        shade3 = hsl(250, 100, 80),
    },
    Secondary = {
        shade0 = hsl(300, 100, 20),
        shade1 = hsl(300, 100, 40),
        shade2 = hsl(300, 100, 60),
        shade3 = hsl(300, 100, 80),
    },
    Tertiary = {
        shade0 = hsl(50, 100, 40),
        shade1 = hsl(50, 100, 50),
        shade2 = hsl(50, 100, 70),
        shade3 = hsl(50, 100, 90),
    },
    Quartenary = {
        shade0 = hsl(0, 90, 20),
        shade1 = hsl(0, 90, 40),
        shade2 = hsl(0, 90, 60),
        shade3 = hsl(0, 90, 80),
    },
    Quintary = {
        shade0 = hsl(180, 100, 25),
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
                shade0 = hsl(10, 100, 85),
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
          CursorLine   { bg = VaporLush.Background                                                            },      
          Directory    { bg = VaporLush.Background,       fg = VaporLush.Quintary.shade1,     gui = underline },      
          DiffAdd      { bg = VaporLush.Quintary.shade2,      fg = VaporLush.Secondary.shade0                     },      -- Diff mode: Added line |diff.txt|
          DiffChange   { bg = VaporLush.Quintary.shade3,      fg = VaporLush.Secondary.shade2                     },      -- Diff mode: Changed line |diff.txt|
          DiffDelete   { bg = VaporLush.Primary.shade1,       fg = VaporLush.Quartenary.shade2                    },      -- Diff mode: Deleted line |diff.txt|
          DiffText     { bg = VaporLush.Quartenary.shade2,    fg = VaporLush.Tertiary.shade3,     gui=italic      },      
          EndOfBuffer  {  bg = VaporLush.Background,      fg = VaporLush.Secondary.shade0,    gui=italic      },      
          VertSplit    {  bg = VaporLush.Background,      fg = VaporLush.Secondary.shade0                     },      -- Column separating vertically split windows
          Folded       { bg = VaporLush.Background,       fg = VaporLush.Secondary.shade2                     },      -- Line used for closed folds
          FoldColumn   { bg = Folded.bg,                      fg = Folded.fg                                      },      -- 'foldcolumn'
          SignColumn   { bg = Folded.bg,                      fg = VaporLush.Quartenary.shade2                    },      -- Column where |signs| are displayed
          IncSearch    { bg = VaporLush.Quartenary.shade2,    fg = VaporLush.Tertiary.shade3                      },      
          Substitute   { bg = VaporLush.Quartenary.shade1,    fg = VaporLush.Tertiary.shade2                      },      
          LineNr       { bg = VaporLush.Background,       fg = VaporLush.Secondary.shade3                     },      
          CursorLineNr {  bg = VaporLush.Primary.shade1,      fg = VaporLush.Quintary.shade1                      },      
          Normal       { bg = VaporLush.Background,       fg = VaporLush.Secondary.shade3                     },      -- Normal text
          Pmenu        { SignColumn                                                                                   },      -- Popup menu: Normal item.
          PmenuSel     { bg = VaporLush.Background,       fg = VaporLush.Tertiary.shade3                      },      -- Popup menu: Selected item.
          PmenuSbar    { bg = VaporLush.Primary.shade3,       fg = VaporLush.Quintary.shade0                      },      -- Popup menu: Scrollbar.
          PmenuThumb   { bg = VaporLush.Primary.shade3,       fg = VaporLush.Quintary.shade1                      },      -- Popup menu: Thumb of the scrollbar.
          Question     { bg = VaporLush.Secondary.shade0,     fg = VaporLush.Secondary.shade2                     },      -- |hit-enter| prompt and yes/no questions
          Search       { bg = VaporLush.Tertiary.shade3,      fg = VaporLush.Background                       }, 
          Visual       { bg = VaporLush.Secondary.shade0,     fg = VaporLush.Tertiary.shade3                      },      -- Visual mode selection
          Comment      { bg = VaporLush.Background,       fg = VaporLush.Quintary.shade3,     gui=italic      },      -- Any comment
          Constant     { bg = Normal.bg,                      fg = VaporLush.Quintary.shade2                      },      -- (*) Any constant
          String       { bg = Normal.bg,                      fg = VaporLush.Quintary.shade1                      },      --   A string constant: "this is a string"
          Character    { String                                                                                   },      --   A character constant: 'c', '\n'
          Number       { bg = Normal.bg,                      fg = Constant.fg                                    },      --   A number constant: 234, 0xff
          Boolean      { Constant,                                                                gui=italic      },      --   A boolean constant: TRUE, false
          Float        { Number                                                                                   },      --   A floating point constant: 2.3e10
          Identifier   { bg = Nomal.bg,                       fg=VaporLush.Secondary.shade1,      gui=italic          },      -- (*) Any variable name
          Function     { bg = Nomal.bg,                       fg=VaporLush.Tertiary.shade2,      gui="italic, bold"      },      
          Statement      { bg = VaporLush.Background,     fg = VaporLush.Primary.shade1,      gui=""          },      -- (*) Any statement
          Conditional    { Statement                                                                              },      --   if, then, else, endif, switch, etc.
          Repeat         { Statement,                                                             gui=italic      },      --   for, do, while, etc.
              Label          { bg=VaporLush.Background,       fg=VaporLush.Primary.shade2, gui=italic      },      --   case, default, etc.
              Operator       { Label                                                                                  },      --   "sizeof", "+", "*", etc.
              Keyword        { Label                                                                                  },      --   any other keyword
              Exception      { Label                                                                                 },      --   try, catch, throw
              PreProc        { bg = Normal.bg,                    fg = VaporLush.Tertiary.shade2,     gui=italic      },      -- (*) Generic Preprocessor
              Include        { PreProc                                                                                },      --   Preprocessor #include
              Define         { PreProc                                                                                },      --   Preprocessor #define
              Macro          { PreProc                                                                                },      --   Same as Define
              PreCondit      { PreProc                                                                                },      --   Preprocessor #if, #else, #endif, etc.
              Type           { bg = Normal.bg,                    fg = VaporLush.Quartenary.shade1,    gui=italic      },      -- (*) int, long, char, etc.
              StorageClass   { Type,                                                                                  },      --   static, register, volatile, etc.
              Structure      { bg = Normal.bg,                    fg = VaporLush.Quartenary.shade2,   gui="bold, italic"      },      --   struct, union, enum, etc.
              Typedef        { Structure                                                                              },      --   A typedef
              Special        { bg = Normal.bg,                    fg = VaporLush.Quartenary.shade3                      },      -- (*) Any special symbol
              SpecialChar    { Special                                                                                },      --   Special character in a constant
              Tag            { Special                                                                                },      --   You can use CTRL-] on this
              Delimiter      { Statement                                                                                },      --   Character that needs attention
              SpecialComment { Special,                                                               gui = italic    },      
              Debug          { SpecialComment                                                                         },      --   Debugging statements
              Underlined     { bg= Normal.bg,                     fg= VaporLush.Secondary.shade1,     gui = underline },      -- Text that stands out, HTML links
              Ignore         { bg= VaporLush.Tertiary.shade0,     fg= VaporLush.Quartenary.shade2,    gui = italic    },      
              Error          { bg= VaporLush.Secondary.shade2,     fg= VaporLush.Quintary.shade3                      },      -- Any erroneous construct
              Todo           { bg= VaporLush.Primary.shade2,   fg= VaporLush.Quintary.shade3,       }, 


              sym"@text.literal"      { Comment }, -- Comment
              sym"@text.reference"    { Identifier }, -- Identifier
              sym"@text.title"        { Identifier }, -- Title
              sym"@text.uri"          { Underlined }, -- Underlined
              sym"@text.underline"    { Underlined }, -- Underlined
              sym"@text.todo"         { Todo }, -- BUG:
              sym"@text.warning"         {  bg= VaporLush.Tertiary.shade2,   fg= VaporLush.Secondary.shade1,       }, -- TODO:
              sym"@text.note"        {  bg= VaporLush.Secondary.shade0,   fg= VaporLush.Tertiary.shade1,      }, -- WARNING(adam):
              sym"@text.danger"        {  bg= VaporLush.Quartenary.shade1,   fg= VaporLush.Quintary.shade2,      }, -- FIXME:
              sym"@comment"           { Comment }, -- Comment
              sym"@punctuation"       { Delimiter }, -- Delimiter
              sym"@constant"          { Constant }, -- Constant
              sym"@constant.builtin"  { Special }, -- Special
              sym"@constant.macro"    { Define }, -- Define
              sym"@define"            { Define }, -- Define
              sym"@macro"             { Define }, -- Macro
              sym"@string"            { String }, -- String
              sym"@string.escape"     { SpecialChar }, -- SpecialChar
              sym"@string.special"    { SpecialChar }, -- SpecialChar
              sym"@character"         { Character }, -- Character
              sym"@character.special" { SpecialChar }, -- SpecialChar
              sym"@number"            { Number }, -- Number
              sym"@boolean"           { Boolean }, -- Boolean
              sym"@float"             { Float }, -- Float
              sym"@function"          { Function, gui="bold" }, -- Function
              sym"@function.builtin"  { Special }, -- Special
              sym"@function.macro"    { Macro }, -- Macro
              sym"@parameter"         { Identifier }, -- Identifier
              sym"@method"            { Function }, -- Function
              sym"@field"             { Identifier }, -- Identifier
              sym"@property"          { Identifier }, -- Identifier
              sym"@constructor"       { bg=Normal.bg,  fg=VaporLush.Quintary.shade0 }, -- Special
              sym"@conditional"       { Conditional }, -- Conditional
              sym"@repeat"            { Repeat }, -- Repeat
              sym"@label"             { Label }, -- Label
              sym"@operator"          { Operator }, -- Operator
              sym"@keyword"           { Keyword }, -- Keyword
              sym"@exception"         { Exception }, -- Exception
              sym"@variable"          { bg=Normal.bg, fg=VaporLush.Primary.shade3 }, -- Identifier
              sym"@type"              { Type }, -- Type
              sym"@type.definition"   { Typedef }, -- Typedef
              sym"@storageclass"      { StorageClass }, -- StorageClass
              sym"@structure"         { Structure }, -- Structure
              sym"@namespace"         { Structure }, -- Identifier
              sym"@include"           { Include }, -- Include
              sym"@preproc"           { PreProc }, -- PreProc
              sym"@debug"             { Debug }, -- Debug
              sym"@tag"               { Tag }, -- Tag
        }
    end
)
