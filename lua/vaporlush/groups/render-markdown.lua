local Util = require("vaporlush.util")

local M = {}

--- @param c Vaporlush.Palette
--- @param opts Vaporlush.Config
--- @return { [string]: VaporLush.Mapping }
M.mappings = function(c, opts)
    -- Per-level heading colors. `bg` is a dark tint of the level's hue blended
    -- into the scheme background (the full-width bar); `fg` is the bright shade of
    -- the same hue (the sign/icon). The heading TEXT colors that sit on these bars
    -- live in groups/treesitter.lua (@markup.heading.N.markdown) and are kept in
    -- sync with the `fg` values below.
    local heads = {
        { fg = c.fg,           bg = Util.blend_bg(c.primary1,     0.30, c.bg) }, -- H1 blue
        { fg = c.tertiary3,    bg = Util.blend_bg(c.tertiary1,    0.30, c.bg) }, -- H2 purple
        { fg = c.secondary3,   bg = Util.blend_bg(c.secondary1,   0.30, c.bg) }, -- H3 pink
        { fg = c.quartary3,    bg = Util.blend_bg(c.quartary1,    0.30, c.bg) }, -- H4 orange
        { fg = c.gitsigns.add, bg = Util.blend_bg(c.gitsigns.info, 0.45, c.bg) }, -- H5 teal
        { fg = c.tertiary3,    bg = Util.blend_bg(c.tertiary2,    0.26, c.bg) }, -- H6 purple
    }

    -- A subtle raised surface for code blocks / inline code.
    local code_bg = c.bg_highlight

    return {
        -- Heading sign/icon (render-markdown `foregrounds`)
        RenderMarkdownH1 = { fg = heads[1].fg, bold = true },
        RenderMarkdownH2 = { fg = heads[2].fg, bold = true },
        RenderMarkdownH3 = { fg = heads[3].fg, bold = true },
        RenderMarkdownH4 = { fg = heads[4].fg, bold = true },
        RenderMarkdownH5 = { fg = heads[5].fg, bold = true },
        RenderMarkdownH6 = { fg = heads[6].fg, bold = true },

        -- Full-width heading bar (render-markdown `backgrounds`)
        RenderMarkdownH1Bg = { bg = heads[1].bg },
        RenderMarkdownH2Bg = { bg = heads[2].bg },
        RenderMarkdownH3Bg = { bg = heads[3].bg },
        RenderMarkdownH4Bg = { bg = heads[4].bg },
        RenderMarkdownH5Bg = { bg = heads[5].bg },
        RenderMarkdownH6Bg = { bg = heads[6].bg },

        -- Code
        RenderMarkdownCode           = { bg = code_bg },
        RenderMarkdownCodeInline     = { bg = code_bg, fg = c.quartary2 },
        RenderMarkdownInlineHighlight = { bg = c.secondary0, fg = c.fg }, -- ==highlight==

        -- Structure
        RenderMarkdownBullet   = { fg = c.tertiary2, bold = true },
        RenderMarkdownDash     = { fg = c.comment },
        RenderMarkdownQuote    = { fg = c.comment, italic = true },
        RenderMarkdownSign     = { fg = c.comment },
        RenderMarkdownMath     = { fg = c.tertiary3 },

        -- Links
        RenderMarkdownLink     = { fg = c.tertiary3, underline = true },
        RenderMarkdownWikiLink = { fg = c.tertiary3, underline = true },

        -- Checkboxes / todos
        RenderMarkdownChecked   = { fg = c.gitsigns.add, bold = true },
        RenderMarkdownUnchecked = { fg = c.comment },
        RenderMarkdownTodo      = { fg = c.gitsigns.change, bold = true },

        -- Callouts (link to diagnostics for consistency)
        RenderMarkdownSuccess = { fg = c.gitsigns.add },
        RenderMarkdownHint    = { fg = c.gitsigns.add },
        RenderMarkdownInfo    = { fg = c.gitsigns.info },
        RenderMarkdownWarn    = { fg = c.gitsigns.change },
        RenderMarkdownError   = { fg = c.gitsigns.danger },

        -- Tables
        RenderMarkdownTableHead = { fg = c.tertiary3, bold = true },
        RenderMarkdownTableRow  = { fg = c.fg },
        RenderMarkdownTableFill = { fg = c.comment },

        RenderMarkdownHtmlComment = { fg = c.comment, italic = true },
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
