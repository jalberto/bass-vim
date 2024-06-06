-- required in ui.lua
local function color_pattern(fg, bg, gui)
  local result = {}
  if type(fg) ~= 'nil' then
    result.fg = fg
  end

  if type(bg) ~= 'nil' then
    result.bg = bg
  end

  if type(gui) ~= 'nil' then
    result.gui = gui
  end

  return result
end

local M = {}

M.theme = function()
  local result = {}

  local ok = pcall(require, 'falcon')
  if not ok then
    return result
  end

  local palette = vim.g['falcon.palette']
  if type(palette) ~= 'table' then
    return result
  end

  result = {
    normal = {
      a = color_pattern(palette.normal_gray, palette.black),
      b = color_pattern(palette.normal_gray, palette.status_2),
      c = color_pattern(palette.normal_gray, palette.status)
    },

    insert = {
      a = color_pattern(palette.red, palette.black),
      b = color_pattern(palette.normal_gray, palette.status_2),
      c = color_pattern(palette.normal_gray, palette.status),
    },

    terminal = {
      a = color_pattern(palette.red, palette.black),
      b = color_pattern(palette.normal_gray, palette.status_2),
      c = color_pattern(palette.normal_gray, palette.status),
    },

    visual = {
      a = color_pattern(palette.yellow, palette.black),
      b = color_pattern(palette.normal_gray, palette.status_2),
      c = color_pattern(palette.normal_gray, palette.status),
    },

    replace = {
      a = color_pattern(palette.orange, palette.black),
      b = color_pattern(palette.normal_gray, palette.status_2),
      c = color_pattern(palette.normal_gray, palette.status),
    },

    command = {
      a = color_pattern(palette.indigo, palette.black),
      b = color_pattern(palette.normal_gray, palette.status_2),
      c = color_pattern(palette.normal_gray, palette.status),
    },

    inactive = {
      a = color_pattern(palette.mid_gray, palette.status_2),
      b = color_pattern(palette.mid_gray, palette.status_2),
      c = color_pattern(palette.mid_gray, palette.status_2),
    }
  }

  return result
end

return M
