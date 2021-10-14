local PrepFilter = require(script.Parent._Filter)

local lshift = bit32.lshift
local clamp = math.clamp
local min = math.min

return PrepFilter("Dodge", function(background: number, foreground: number): number
  local bg = clamp(background * 255, 0, 255)
  local fg = foreground * 255

  return (bg == 255) and bg or min(255, lshift(fg, 8) / (255 - bg))
end)