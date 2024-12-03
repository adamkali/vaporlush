
-- You probably always want to set this in your vim file
vim.opt.background = 'dark'
vim.g.colors_name = 'vaporlush.vapor'
package.loaded['vaporlush.vaporlush'] = nil
require("vaporlush").load({style = "vapor"})

