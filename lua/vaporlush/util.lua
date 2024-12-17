local M = {}

local vapor_defalt = require'vaporlush.schemes.vapor'
M.bg = vapor_defalt.bg
M.fg = vapor_defalt.fg 
M.black = '#000000'
M.day_brightness = 0.3

local uv = vim.uv or vim.loop

---@param colorscheme Vaporlush.Palette
M.lualine = function(colorscheme)
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
end

---@param c  string
local function rgb(c)
  c = string.lower(c)
  return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

local me = debug.getinfo(1, "S").source:sub(2)
me = vim.fn.fnamemodify(me, ":h:h")

function M.mod(modname)
  if package.loaded[modname] then
    return package.loaded[modname]
  end
  local ret = loadfile(me .. "/" .. modname:gsub("%.", "/") .. ".lua")()
  package.loaded[modname] = ret
  return ret
end

---@param foreground string foreground color
---@param background string background color
---@param alpha number|string number between 0 and 1. 0 results in bg, 1 results in fg
function M.blend(foreground, alpha, background)
  alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
  local bg = rgb(background)
  local fg = rgb(foreground)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

function M.blend_bg(hex, amount, bg)
  return M.blend(hex, amount, bg or M.bg)
end
M.darken = M.blend_bg

function M.blend_fg(hex, amount, fg)
  return M.blend(hex, amount, fg or M.fg)
end
M.lighten = M.blend_fg

---@param color string|Palette
function M.invert(color)
  if type(color) == "table" then
    for key, value in pairs(color) do
      color[key] = M.invert(value)
    end
  elseif type(color) == "string" then
    local hsluv = require("vaporlush.hsluv")
    if color ~= "NONE" then
      local hsl = hsluv.hex_to_hsluv(color)
      hsl[3] = 100 - hsl[3]
      if hsl[3] < 40 then
        hsl[3] = hsl[3] + (100 - hsl[3]) * M.day_brightness
      end
      return hsluv.hsluv_to_hex(hsl)
    end
  end
  return color
end

---@param color string  -- The hex color string to be adjusted
---@param lightness_amount number? -- The amount to increase lightness by (optional, default: 0.1)
---@param saturation_amount number? -- The amount to increase saturation by (optional, default: 0.15)
function M.brighten(color, lightness_amount, saturation_amount)
  lightness_amount = lightness_amount or 0.05
  saturation_amount = saturation_amount or 0.2
  local hsluv = require("vaporlush.hsluv")

  -- Convert the hex color to HSLuv
  local hsl = hsluv.hex_to_hsluv(color)

  -- Increase lightness slightly
  hsl[3] = math.min(hsl[3] + (lightness_amount * 100), 100)

  -- Increase saturation a bit more to make the color more vivid
  hsl[2] = math.min(hsl[2] + (saturation_amount * 100), 100)

  -- Convert the HSLuv back to hex and return
  return hsluv.hsluv_to_hex(hsl)
end

---@param groups Vaporlush.Highlights
---@return table<string, vim.api.keyset.highlight>
function M.resolve(groups)
  for _, hl in pairs(groups) do
    if type(hl.style) == "table" then
      for k, v in pairs(hl.style) do
        hl[k] = v
      end
      hl.style = nil
    end
  end
  return groups
end

-- Simple string interpolation.
--
-- Example template: "${name} is ${value}"
--
---@param str string template string
---@param table table key value pairs to replace in the string
function M.template(str, table)
  return (
    str:gsub("($%b{})", function(w)
      return vim.tbl_get(table, unpack(vim.split(w:sub(3, -2), ".", { plain = true }))) or w
    end)
  )
end

---@param file string
function M.read(file)
  local fd = assert(io.open(file, "r"))
  ---@type string
  local data = fd:read("*a")
  fd:close()
  return data
end

---@param file string
---@param contents string
function M.write(file, contents)
  vim.fn.mkdir(vim.fn.fnamemodify(file, ":h"), "p")
  local fd = assert(io.open(file, "w+"))
  fd:write(contents)
  fd:close()
end

M.cache = {}

function M.cache.file(key)
  return vim.fn.stdpath("cache") .. "/vaporlush-" .. key .. ".json"
end

---@param key string
function M.cache.read(key)
  ---@type boolean, Vaporlush.Cache
  local ok, ret = pcall(function()
    return vim.json.decode(M.read(M.cache.file(key)), { luanil = {
      object = true,
      array = true,
    } })
  end)
  return ok and ret or nil
end

---@param key string
---@param data Vaporlush.Cache
function M.cache.write(key, data)
  pcall(M.write, M.cache.file(key), vim.json.encode(data))
end

function M.cache.clear()
  for _, style in ipairs({ "storm", "day", "night", "moon" }) do
    uv.fs_unlink(M.cache.file(style))
  end
end

---comment
---@param hl_group string
---@param c Vaporlush.Palette
---@param opts Vaporlush.Config
---@return VaporLush.Mapping
---@see Vaporlush.Mapping.Set the Vaporlush.Mapping
function M.get_hl_group_base(hl_group, c, opts) 
    return require('vaporlush.groups.base').mappings(c, opts)[hl_group]
end

---comment
---@param hl_group string
---@param c Vaporlush.Palette
---@param opts Vaporlush.Config
---@param group_name string
---@param inv? boolean
---@return VaporLush.Mapping
---@see Vaporlush.Mapping.Set the Vaporlush.Mapping
function M.get_hl_group(hl_group, c, opts, group_name, inv)
    local mapping = require('vaporlush.groups.'..group_name).mappings(c, opts)[hl_group]
    return mapping
end


return M
