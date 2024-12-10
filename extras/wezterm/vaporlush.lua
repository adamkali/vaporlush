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

BlossomPalette = {
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
    tertiary0 = '#e6b800',
    tertiary1 = '#e6da00',
    tertiary2 = '#f3e500',
    tertiary3 = '#fffa99',
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

local PALETTE = VaporPalette

function Palette(name)
    if name == 'vapor' then
        PALETTE = VaporPalette
    elseif name == 'blossom' then
        PALETTE = BlossomPalette
    end
end

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

