local M = {}

M.version = "2.00.0" -- x-release-please-version

---@class Vaporlush.Config
M.defaults = {
  style = "vapor", -- The theme comes in three styles, `storm`,
  -- light_style = "day", -- The theme is used when the background is set to light
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  cache = true, -- When set to true, the theme will be cached for better performance

  ---@type table<string, boolean|{enabled:boolean}>
  plugins = {
    -- enable all plugins when not using lazy.nvim
    -- set to false to manually enable/disable plugins
    all = package.loaded.lazy == nil,
    auto = true,
    --   * https://github.com/folke/tokyonight.nvim/tree/main/lua/tokyonight/groups
    -- telescope = true,
  },
}

---@type Vaporlush.Config
M.options = nil

---@param options? Vaporlush.Config
function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
  vim.cmd("colorscheme " .. M.options.style)
end

---@param opts? Vaporlush.Config
function M.extend(opts)
  return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or M.options
end

setmetatable(M, {
  __index = function(_, k)
    if k == "options" then
      return M.defaults
    end
  end,
})



return M
