
local colorscheme = require('vaporlush.schemes.1996')
return {
    normal = {
        a = { bg = colorscheme.primary0, fg = colorscheme.quartary2, gui = 'bold' },
        b = { bg = colorscheme.quartary2, fg = colorscheme.primary3 },
        c = { bg = colorscheme.bg, fg = colorscheme.quartary3 }
    },
    insert = {
        a = { bg = colorscheme.secondary1, fg = colorscheme.primary2, gui = 'bold' },
        b = { bg = colorscheme.primary2, fg = colorscheme.secondary3, gui = 'italic' },
        c = { bg = colorscheme.bg, fg = colorscheme.primary3 }
    },
    visual = {
        a = { bg = colorscheme.tertiary0, fg = colorscheme.primary3, gui = 'bold' },
        b = { bg = colorscheme.primary2, fg = colorscheme.tertiary3, gui = 'italic' },
        c = { bg = colorscheme.bg, fg = colorscheme.primary3 }
    },
    replace = {
        a = { bg = colorscheme.quartary3, fg = colorscheme.bg, gui = 'bold' },
        b = { bg = colorscheme.primary3, fg = colorscheme.primary0, gui = 'italic' },
        c = { bg = colorscheme.bg, fg = colorscheme.primary3 }
    },
    command = {
        a = { bg = colorscheme.quartary1, fg = colorscheme.secondary2, gui = 'bold' },
        b = { bg = colorscheme.secondary2, fg = colorscheme.quartary3, gui = 'italic' },
        c = { bg = colorscheme.bg, fg = colorscheme.secondary3 }
    },
    inactive = {
        a = { bg = colorscheme.comment, fg = colorscheme.bg, gui = 'bold' },
        b = { bg = colorscheme.comment, fg = colorscheme.bg },
        c = { bg = colorscheme.comment, fg = colorscheme.bg }
    }
}
