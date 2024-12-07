-- vapor theme for wezterm
VaporPalette = {
    bg = '#0e102d',
    fg = '#dbe9ff',
    bg_highlight = '#3a3856',
    fg_highlight = '#ebf9ff',
    comment = '#9098a6',
    primary0 = '#0700de',
    primary1 = '#0b03fc',
    primary2 = '#352ff5',
    primary3 = '#4e47ff',
    secondary0 = '#b50465',
    secondary1 = '#e60580',
    secondary2 = '#fa34a1',
    secondary3 = '#fc65b8',
    tertiary0 = '#e6b800',
    tertiary1 = '#e6da00',
    tertiary2 = '#f3e500',
    tertiary3 = '#fffa99',
    quartary0 = '#006655',
    quartary1 = '#00ccaa',
    quartary2 = '#33ffdd',
    quartary3 = '#99ffee',
    gitsigns = {
        info = '#30fcae',
        add = '#dfff50',
        change = '#ebb134',
        danger = '#ff4334'
    }
}


return {
    foreground = VaporPalette.fg,
    background = VaporPalette.bg,

    cursor_bg = VaporPalette.comment,
    cursor_fg = VaporPalette.primary2,
    cursor_border = VaporPalette.primary2,

    selection_fg = VaporPalette.fg,
    selection_bg = VaporPalette.secondary0,

    scrollbar_thumb = VaporPalette.bg,
    split = VaporPalette.comment,

    ansi = { VaporPalette.bg, VaporPalette.gitsigns.danger, VaporPalette.quartary1, VaporPalette.tertiary2, VaporPalette.primary1, VaporPalette.secondary0, VaporPalette.quartary3, VaporPalette.fg_highlight },
    brights = { VaporPalette.bg, VaporPalette.gitsigns.danger, VaporPalette.quartary1, VaporPalette.tertiary2, VaporPalette.primary1, VaporPalette.secondary0, VaporPalette.quartary3, VaporPalette.fg_highlight },
    indexed = { [16] = "#ffbd5e", [17] = "#ff6e5e" },
}

