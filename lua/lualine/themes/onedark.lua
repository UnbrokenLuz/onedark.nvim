local c = require('onedark.colors')

local one_dark = {
    inactive = {
        a = {fg = c.stone, bg = c.bg0, gui = 'bold'},
        b = {fg = c.stone, bg = c.bg0},
        c = {fg = c.stone, bg = c.bg1},
    },
    normal = {
        a = {fg = c.bg0, bg = c.sage, gui = 'bold'},
        b = {fg = c.ivory, bg = c.bg3},
        c = {fg = c.ivory, bg = c.bg1},
    },
    visual = {a = {fg = c.bg0, bg = c.violet, gui = 'bold'}},
    replace = {a = {fg = c.bg0, bg = c.coral, gui = 'bold'}},
    insert = {a = {fg = c.bg0, bg = c.malibu, gui = 'bold'}},
    command = {a = {fg = c.bg0, bg = c.chakly, gui = 'bold'}}
}
return one_dark;
