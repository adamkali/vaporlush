local M = {}

--- @param c Vaporlush.Palette
--- @param opts Vaporlush.Config
--- @return { [string]: VaporLush.Mapping }
M.mappings = function(c, opts)
    return {
        RenderMarkdownH1 = { fg = c.comment, bg = c.primary0, italic = true },
        RenderMarkdownH2 = { fg = c.comment, bg = c.secondary0, italic = true },
        RenderMarkdownH3 = { fg = c.comment, bg = c.tertiary0, italic = true },
        RenderMarkdownH4 = { fg = c.comment, bg = c.quartary0, italic = true },
        RenderMarkdownH5 = { fg = c.comment, bg = c.primary1, italic = true },
        RenderMarkdownH6 = { fg = c.comment, bg = c.secondary1, italic = true },
        RenderMarkdownCode = { },
        RenderMarkdownDash = {},
        RenderMarkdownH1Bg = { fg = c.primary0, italic = true },
        RenderMarkdownH2Bg = { fg = c.secondary0, italic = true },
        RenderMarkdownH3Bg = { fg = c.tertiary0, italic = true },
        RenderMarkdownH4Bg = { fg = c.quartary0, italic = true },
        RenderMarkdownH5Bg = { fg = c.primary1, italic = true },
        RenderMarkdownH6Bg = { fg = c.secondary1, italic = true },
        RenderMarkdownHint = {},
        RenderMarkdownInfo = {},
        RenderMarkdownLink = {},
        RenderMarkdownMath = {},
        RenderMarkdownSign = {},
        RenderMarkdownTodo = {},
        RenderMarkdownWarn = {},
        RenderMarkdownError = {},
        RenderMarkdownQuote = {},
        RenderMarkdownBullet = {},
        RenderMarkdownChecked = {},
        RenderMarkdownSuccess = {},
        RenderMarkdownTableRow = {},
        RenderMarkdownWikiLink = {},
        RenderMarkdownTableFill = {},
        RenderMarkdownTableHead = {},
        RenderMarkdownUnchecked = {},
        RenderMarkdownCodeInline = {},
        RenderMarkdownHtmlComment = {},
        RenderMarkdownInlineHighlight = {},
    }
end
