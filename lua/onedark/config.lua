local function get(setting, default)
    local key = "onedark_" .. setting
    if vim.g[key] == nil then return default end
    return vim.g[key]
end

local config = {
    bg = get("transparent_background", false),
    italics = get("italics", true),
    diagnostics_undercurl = get("diagnostics_undercurl", true),
    darker_diagnostics = get("darker_diagnostics", true),
    diagnostics_text_bg = get("diagnostics_text_bg", true),
    disable_terminal_colors = get("disable_terminal_colors", false),
    hide_ending_tildes = get("hide_ending_tildes", true),
}

return config
