local Util = require("vaporlush.util")
local vapor_base = require("vaporlush.groups.base")

local M = {}

--- @param c Vaporlush.Palette
--- @param opts Vaporlush.Config
--- @return { [string]: VaporLush.Mapping }
M.mappings = function(c, opts)
    return {
      OilHidden = { fg = c.comment },
      OilDir = { fg = c.tertiary2, italic = true },
      OilDirHidden  = { fg = c.tertiary3, italic = true },
      OilDirIcon  = { fg = c.tertiary2 },
      OilSocket  = { fg = c.tertiary1, italic = true, underline = true, },
      OilSocketHidden  = { fg = c.tertiary3, italic = true, underline = true },
      OilLink  = { fg = c.quartary2, underline = true },
      OilOrphanLink  = { fg = c.quartary0},
      OilLinkHidden  = { fg = c.comment },
      OilOrphanLinkHidden  = { fg = c.comment },
      OilLinkTarget  = { fg = c.quartary0, bg = c.quartary3 },
      OilLinkTargetHidden  = { fg = c.quartary3, bg = c.comment},
      OilFile  = { fg = c.primary2 },
      OilFileHidden  = { fg = c.comment},
      OilCreate  = {  bg = c.secondary3 },
      OilDelete  = { bg = c.gitsigns.danger },
      OilMove  = { bg = c.gitsigns.change },
      OilCopy  = { bg = c.gitsigns.add},
      OilChange  = { bg = c.gitsigns.change },
      OilRestore  = { bg = c.primary3, fg=c.primary0, bold = true },
      OilPurge  = { bg = c.gitsigns.danger, bold = true},
      OilTrash  = { bg = c.gitsigns.danger, fg = c.tertiary3, bold = true},
      OilTrashSourcePath  = { bg = c.gitsigns.danger, fg = c.tertiary3, bold = true},
    }
end

--- @type Vaporlush.Mapping.Set
function M.set(c, opts, nvim_set_hl)
    for key, mapping in pairs(M.mappings(c, opts)) do
        nvim_set_hl(key, mapping)
    end
end

return M

