-- `:colorscheme vaporlush` -> load the default style (see config.lua M.defaults.style).
-- Style-specific entry points live in colors/vapor.lua, colors/1996.lua, colors/blossom.lua.
vim.g.colors_name = 'vaporlush'
package.loaded['vaporlush'] = nil
require("vaporlush").load({})
