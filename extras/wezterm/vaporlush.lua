VaporPalette = {
    bg = '#0e102d',
    fg = '#82a6fa',
    bg_highlight = '#0a2846',
    fg_highlight = '#5885ed',
    comment = '#8da0b8',
    primary0 = '#0700de',
    primary1 = '#0b03fc',
    primary2 = '#352ff5',
    primary3 = '#4e47ff',
    secondary0 = '#b50465',
    secondary1 = '#e60580',
    secondary2 = '#fa34a1',
    secondary3 = '#fc65b8',
    tertiary0 = '#3f10cc',
    tertiary1 = '#6439e6',
    tertiary2 = '#8864f5',
    tertiary3 = '#af95fc',
    quartary0 = '#fc5e03',
    quartary1 = '#fc853f',
    quartary2 = '#f59b67',
    quartary3 = '#ffb68c',
    gitsigns = {
        info = '#006655',
        add = '#00ccaa',
        change = '#e3307a',
        danger = '#c71e26'
    }
}

BlossumPalette = {
    bg = '#1a0c29',
    fg = '#eec5fa',
    bg_highlight = '#5a3856',
    fg_highlight = '#d5a6e3',
    comment = '#765580',
    primary0 = '#b50465',
    primary1 = '#e60580',
    primary2 = '#fa34a1',
    primary3 = '#fc65b8',
    secondary0 = '#0360ab',
    secondary1 = '#1e8ae3',
    secondary2 = '#4ba7f2',
    secondary3 = '#86c7fc',
    tertiary0 = '#048f63',
    tertiary1 = '#06bd83',
    tertiary2 = '#43e0af',
    tertiary3 = '#56f5c2',
    quartary0 = '#6e0329',
    quartary1 = '#b0154b',
    quartary2 = '#ed427e',
    quartary3 = '#ff85af',
    gitsigns = {
        info = '#30fcae',
        add = '#dfff50',
        change = '#ebb134',
        danger = '#0517b5'
    }
}

-- CHANGE ME!!!
_G.PALETTE = VaporPalette
return {
    foreground = PALETTE.fg,
    background = PALETTE.bg,

    cursor_bg = PALETTE.comment,
    cursor_fg = PALETTE.primary2,
    cursor_border = PALETTE.primary2,

    selection_fg = PALETTE.fg,
    selection_bg = PALETTE.secondary0,

    scrollbar_thumb = PALETTE.bg,
    split = PALETTE.comment,

    ansi = { PALETTE.bg, PALETTE.gitsigns.danger, PALETTE.quartary1, PALETTE.tertiary2, PALETTE.primary1, PALETTE.secondary0, PALETTE.quartary3, PALETTE.fg_highlight },
    brights = { PALETTE.bg, PALETTE.gitsigns.danger, PALETTE.quartary1, PALETTE.tertiary2, PALETTE.primary1, PALETTE.secondary0, PALETTE.quartary3, PALETTE.fg_highlight },
    indexed = { [16] = "#ffbd5e", [17] = "#ff6e5e" },
}
