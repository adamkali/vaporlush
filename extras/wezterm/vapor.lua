-- vapor theme for wezterm
VaporPalette = {
    background = '#0e133b',
    foreground = '#dbe9ff',
    comment = '#9098a6',
    blue0 = '#2f1dcf',
    blue1 = '#4535db',
    blue2 = '#6355e0',
    blue3 = '#9287fa',
    purple0 = '#a143fe',
    purple1 = '#b879f7',
    purple2 = '#c79bf3',
    purple3 = '#debdff',
    yellow0 = '#e6b800',
    yellow1 = '#e6da00',
    yellow2 = '#f3e500',
    yellow3 = '#fffa99',
    cyan0 = '#006655',
    cyan1 = '#00ccaa',
    cyan2 = '#33ffdd',
    cyan3 = '#99ffee',
    gitsigns = {
        info = '#f605fa',
        add = '#dfff50',
        change = '#ebb134',
        danger = '#ff4334'
    }
}

return {
    foreground = VaporPalette.foreground,
    background = VaporPalette.background,

    cursor_bg = VaporPalette.comment,
    cursor_fg = VaporPalette.blue2,
    cursor_border = VaporPalette.blue2,

    selection_fg = VaporPalette.foreground,
    selection_bg = VaporPalette.purple0,

    scrollbar_thumb = VaporPalette.background,
    split = VaporPalette.comment,

    ansi = {
        VaporPalette.background,
        VaporPalette.gitsigns.danger,
        VaporPalette.cyan1,
        VaporPalette.yellow2,
        VaporPalette.blue1,
        VaporPalette.purple0,
        VaporPalette.cyan3,
        "#ffffff"
    },
    brights = {
        VaporPalette.background,
        VaporPalette.gitsigns.danger,
        VaporPalette.cyan1,
        VaporPalette.yellow2,
        VaporPalette.blue1,
        VaporPalette.purple0,
        VaporPalette.cyan3,
        "#ffffff"
    },
    indexed = { [16] = "#ffbd5e", [17] = "#ff6e5e" },
}
