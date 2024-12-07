local Util = require("vaporlush.util")
local vaporlush = require("vaporlush.schemes.vapor")

local M = {}

---@param c Vaporlush.Palette
---@return VaporLush.Mapping
M.default_mapping = function (c)
 return { fg = c.fg, bg = c.bg }
end 

---@class VaporLush.Mapping.HiglightGroupFn
---@param c Vaporlush.Palette
---@param opts Vaporlush.Config
---@return { [string]: VaporLush.Mapping }
M.mappings =function(c, opts) return {
    Foo                         = { bg = c.bg, fg = c.fg },
    Comment                     = { bg = c.bg, fg = c.comment, italic = true },     -- any comment
    ColorColumn                 = { bg = c.bg },                                    -- used for the columns set with 'colorcolumn'
    Conceal                     = { fg = c.quartary0 },                             -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor                      = { fg = c.bg, bg = c.fg },                         -- character under the cursor
    lCursor                     = { fg = c.bg, bg = c.fg },                         -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM                    = { fg = c.bg, bg = c.fg },                         -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn                = { bg = c.bg_highlight },                          -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine                  = { bg = c.bg_highlight },                          -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory                   = { fg = c.tertiary2 },                             -- directory names (and other special names in listings)
    DiffAdd                     = { bg = c.gitsigns.add },                          -- diff mode: Added line |diff.txt|
    DiffChange                  = { bg = c.gitsigns.change },                       -- diff mode: Changed line |diff.txt|
    DiffDelete                  = { bg = c.gitsigns.danger },                       -- diff mode: Deleted line |diff.txt|
    DiffText                    = { bg = c.gitsigns.info },                         -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer                 = { fg = c.bg },                                    -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    ErrorMsg                    = { fg = c.gitsigns.danger },                       -- error messages on the command line
    VertSplit                   = { fg = c.comment },                               -- the column separating vertically split windows
    WinSeparator                = { fg = c.comment, bold = true },                  -- the column separating vertically split windows
    Folded                      = { fg = c.primary0, bg = c.fg_highlight },         -- line used for closed folds
    FoldColumn                  = { fg = c.comment },                               -- 'foldcolumn'
    SignColumn                  = { fg = c.fg_highlight },                          -- column where |signs| are displayed
    SignColumnSB                = { bg = c.primary0, fg = c.fg_highlight },         -- column where |signs| are displayed
    Substitute                  = { bg = c.secondary1, fg = c.comment },            -- |:substitute| replacement text highlighting
    LineNr                      = { fg = c.primary3 },                              -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr                = { fg = c.primary2, bold = true },                 -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    LineNrAbove                 = { fg = c.primary2 },
    LineNrBelow                 = { fg = c.primary2 },
    MatchParen                  = { fg = c.quartary2, bold = true },        -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg                     = { fg = c.fg, bold = true },               -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea                     = { fg = c.fg },                            -- Area for messages and cmdline
    MoreMsg                     = { fg = c.primary0 },                      -- |more-prompt|
    NonText                     = { fg = c.secondary0 },                    -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal                      = { fg = c.fg, bg = c.bg },                 -- normal text
    NormalNC                    = { fg = c.fg, bg = c.bg },                 -- normal text in non-current windows
    NormalSB                    = { fg = c.fg, bg = c.bg },                 -- normal text in sidebar
    NormalFloat                 = { fg = c.border_highlight, bg = Util.blend_bg(c.primary3, 0.3) },     -- Normal text in floating windows.
    FloatBorder                 = { fg = c.quartary3, bg = Util.blend_bg(c.primary3, 0.3) },
    FloatTitle                  = { fg = c.border_highlight, bg = Util.blend_bg(c.primary3, 0.3) },
    Pmenu                       = { bg = Util.blend_bg(c.primary3, 0.2),  fg = c.fg },                                   -- Popup menu: normal item.
    PmenuMatch                  = { bg = Util.blend_bg(c.primary3, 0.8),  fg = c.quartary1},                                -- Popup menu: Matched text in normal item.
    PmenuSel                    = { bg = Util.blend_bg(c.fg, 0.8) },                                -- Popup menu: selected item.
    PmenuMatchSel               = { bg = Util.blend_bg(c.fg, 0.8), fg = c.quartary2 },                  -- Popup menu: Matched text in selected item.
    PmenuSbar                   = { bg = Util.blend_fg(c.primary2, 0.95) },                         -- Popup menu: scrollbar.
    PmenuThumb                  = { bg = c.fg_highlight },                                          -- Popup menu: Thumb of the scrollbar.
    Question                    = { fg = c.primary2 },                                              -- |hit-enter| prompt and yes/no questions
    QuickFixLine                = { bg = c.secondary2, bold = true },                               -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search                      = { bg = c.secondary3, fg = c.fg },                                 -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch                   = { bg = c.secondary2, fg = c.bg },                                 -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CurSearch                   = { bg = c.secondary2, fg = c.bg },
    SpecialKey                  = { fg = c.tertiary3 },                                             -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad                    = { sp = c.gitsigns.danger, undercurl = true },                     -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap                    = { sp = c.gitsigns.change, undercurl = true },                     -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal                  = { sp = c.gitsigns.add, undercurl = true },                        -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare                   = { sp = c.gitsigns.info, undercurl = true },                       -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine                  = { fg = c.fg_highlight, bg = c.primary0 },                         -- status line of current window
    StatusLineNC                = { fg = c.fg_highlight, bg = c.primary0 },
    TabLine                     = default,                                                          -- tab pages line, not active tab page label
    TabLineFill                 = { bg = Util.black },                                              -- tab pages line, where there are no labels
    TabLineSel                  = { fg = c.primary0, bg = c.primary2 },                             -- tab pages line, active tab page label
    Title                       = { fg = c.tertiary2, bold = true },                                -- titles for output from ":set all", ":autocmd" etc.
    Visual                      = { bg = c.secondary0 },                                            -- Visual mode selection
    VisualNOS                   = { bg = c.secondary0 },                                            -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg                  = { fg = c.gitsigns.change },                                       -- warning messages
    Whitespace                  = { fg = c.comment },                                               -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu                    = { bg = c.secondary2 },                                            -- current match in 'wildmenu' completion
    WinBar                      = { fg = c.fg_highlight, bg = c.primary0 },                         -- window bar
    WinBarNC                    = { fg = c.fg_highlight, bg = c.primary0 },                         -- window bar in inactive windows
    Bold                        = { bold = true, fg = c.fg },                                       -- (preferred) any bold text
    Character                   = { fg = c.secondary1 },                                            --  a character constant: 'c', '\n'
    Constant                    = { fg = c.secondary1 },                                            -- (preferred) any constant
    Debug                       = { fg = c.gitsigns.change },                                       --    debugging statements
    Special                     = { fg = c.tertiary0 },                                             -- (preferred) any special symbol
    Delimiter                   = { fg = c.tertiary0 },                                             --  character that needs attention
    Error                       = { fg = c.gitsigns.danger },                                       -- (preferred) any erroneous construct
    Function                    = { fg = c.primary3, italic = true, bold = true },                               -- function name (also: methods for classes)
    Identifier                  = { fg = c.secondary2, italic = true },                             -- (preferred) any variable name
    Italic                      = { italic = true, fg = c.fg },                                     -- (preferred) any italic text
    Keyword                     = { fg = c.quartary1, bold = true },                                --  any other keyword
    Operator                    = { fg = c.primary3 },                                              -- "sizeof", "+", "*", etc.
    PreProc                     = { fg = c.quartary0 },                                             -- (preferred) generic Preprocessor
    Statement                   = { fg = c.quartary1 },                                             -- (preferred) any statement
    String                      = { fg = c.primary2 },                                              --   a string constant: "this is a string"
    Todo                        = { bg = c.gitsigns.change, fg = c.comment },                       -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Type                        = { fg = c.quartary0 },                                             -- (preferred) int, long, char, etc.
    Underlined                  = { underline = true },                                             -- (preferred) text that stands out, HTML links
    debugBreakpoint             = { bg = Util.blend_bg(c.primary0, 0.1), fg = c.gitsigns.add },     -- used for breakpoint colors in terminal-debug
    debugPC                     = { bg = c.bg_highlight },                                          -- used for highlighting the current line in terminal-debug
    dosIniLabel                 = { bg = c.bg_highlight },
    helpCommand                 = { bg = Util.black, fg = c.primary0 },
    htmlH1                      = { fg = c.tertiary1, bold = true },
    htmlH2                      = { fg = c.tertiary2, bold = true },
    qfFileName                  = {},
    qfLineNr                    = {},

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own.
    LspReferenceText            = { bg = c.bg_highlight },     -- used for highlighting "text" references
    LspReferenceRead            = { bg = c.fg_highlight },     -- used for highlighting "read" references
    LspReferenceWrite           = { bg = c.fg_highlight },     -- used for highlighting "write" references
    LspSignatureActiveParameter = { bg = Util.blend_bg(c.primary0, 0.2), bold = true },
    LspCodeLens                 = { fg = c.comment },
    LspInlayHint                = { fg = Util.blend_fg(c.primary2, 0.2), italic = true },
    LspInfoBorder               = { fg = Util.blend_fg(c.primary0, 0.5) },

    -- diagnostics
    DiagnosticError             = { fg = c.gitsigns.danger },                                                 -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn              = { fg = c.gitsigns.change },                                                 -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo              = { fg = c.gitsigns.add },                                                    -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint              = { fg = c.gitsigns.add },                                                    -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticUnnecessary       = { fg = c.comment },                                                         -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticVirtualTextError  = { bg = Util.blend_bg(c.gitsigns.danger, 0.1), fg = c.gitsigns.danger },     -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn   = { bg = Util.blend_bg(c.gitsigns.change, 0.1), fg = c.gitsigns.change },     -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo   = { bg = Util.blend_bg(c.gitsigns.add, 0.1), fg = c.gitsigns.add },           -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint   = { bg = Util.blend_bg(c.gitsigns.add, 0.1), fg = c.gitsigns.add },           -- Used for "Hint" diagnostic virtual text
    DiagnosticUnderlineError    = { undercurl = true, sp = c.gitsigns.danger },                               -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn     = { undercurl = true, sp = c.gitsigns.change },                               -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo     = { undercurl = true, sp = c.gitsigns.add },                                  -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint     = { undercurl = true, sp = c.gitsigns.add },                                  -- Used to underline "Hint" diagnostics

    -- Health
    healthError                 = { fg = c.gitsigns.danger },
    healthSuccess               = { fg = c.gitsigns.add },
    healthWarning               = { fg = c.gitsigns.change },

    -- diff (not needed anymore?)
    diffAdded                   = { fg = c.gitsigns.add },
    diffRemoved                 = { fg = c.gitsigns.danger },
    diffChanged                 = { fg = c.gitsigns.change },
    diffOldFile                 = { fg = c.tertiary2 },
    diffNewFile                 = { fg = c.primary2 },
    diffFile                    = { fg = c.gitsigns.add },
    diffLine                    = { fg = c.comment },
    diffIndexLine               = { fg = c.gitsigns.info },
    helpExample                 = { fg = c.comment },
}
end

--- @class Vaporlush.Mapping.Set
--- comment
--- @param c Vaporlush.Palette
--- @param opts any
--- @param nvim_set_hl Vaporlush.HighlightsFn
--- @return nil
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
