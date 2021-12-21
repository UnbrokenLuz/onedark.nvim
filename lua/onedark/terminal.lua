local M = {}
local cfg = require('onedark.config')
local c = require 'onedark.colors'

function M.setup()
    if cfg.disable_terminal_colors then return end
    vim.g.terminal_color_0 = c.stone
    vim.g.terminal_color_1 = c.malibu
    vim.g.terminal_color_2 = c.sage
    vim.g.terminal_color_3 = c.chalky
    vim.g.terminal_color_4 = c.malibu
    vim.g.terminal_color_5 = c.violet
    vim.g.terminal_color_6 = c.cyan
    vim.g.terminal_color_7 = c.ivory
    vim.g.terminal_color_8 = c.black
    vim.g.terminal_color_9 = c.malibu
    vim.g.terminal_color_10 = c.sage
    vim.g.terminal_color_11 = c.chalky
    vim.g.terminal_color_12 = c.malibu
    vim.g.terminal_color_13 = c.violet
    vim.g.terminal_color_14 = c.cyan
    vim.g.terminal_color_15 = c.ivory
end

return M
