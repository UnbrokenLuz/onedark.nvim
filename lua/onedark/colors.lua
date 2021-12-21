local colors = {
        black = { '#181a1f' },
          bg0 = { '#282c34' },
          bg1 = { '#31353f' },
          bg2 = { '#393f4a' },
          bg3 = { '#3b3f4c' },
         bg_d = { '#21252b' },
      bg_blue = { '#73b8f1' },
    bg_yellow = { '#ebd09c' },

       chalky = { '#e5c07b' },
        coral = { '#e06c75' },
         cyan = { '#56b6c2' },
        ivory = { '#abb2bf' },
       malibu = { '#61afef' },
         sage = { '#98c379' },
        stone = { '#5c6370' },
       violet = { '#c678dd' },
      whiskey = { '#d19a66' },

   light_grey = { '#848b98' },
    dark_cyan = { '#2b6f77' },
     dark_red = { '#993939' },
  dark_yellow = { '#93691d' },
  dark_purple = { '#8a3fa0' },
    diff_add =  { '#31392b' },
  diff_delete = { '#382b2c' },
  diff_change = { '#1c3448' },
    diff_text = { '#2c5372' }
}

local styles = { normal = 1 }

local function select_colors()
    local index = styles[vim.g.onedark_style]
    local selected = {}
    for k, v in pairs(colors) do selected[k] = v[index] end
    selected['none'] = 'NONE'
    return selected
end

return select_colors()
